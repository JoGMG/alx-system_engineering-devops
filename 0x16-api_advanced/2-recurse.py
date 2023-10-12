#!/usr/bin/python3
"""
A recursive function that queries the Reddit API and returns a list
containing the titles of all hot posts for a given subreddit.
If no results are found for the given subreddit, the function should
return None.
"""
import requests


def recurse(subreddit, hot_list=[], after=None):
    """
    Returns a list containing the titles of all hot posts of a given subreddit.

    Arguments:
    -   subreddit: The subreddit to search in.
    -   hot_list: The list to append the titles of all hot posts.
    -   after: The listing parameter to go to the next page.
    """

    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    header = {'User-Agent': 'Mozilla/5.0'}
    param = {'after': after}
    response = requests.get(url,
                            headers=header,
                            allow_redirects=False,
                            params=param)

    if response.status_code == 200:
        response_data = response.json()
        after = response_data['data']['after']
        hotposts_data = response_data['data']['children']
        for title in hotposts_data:
            hot_list.append(title['data']['title'])
        if after is None:
            return hot_list
        return recurse(subreddit, hot_list, after)
    else:
        return None
