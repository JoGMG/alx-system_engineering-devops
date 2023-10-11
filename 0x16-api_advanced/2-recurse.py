#!/usr/bin/python3
"""
A recursive function that queries the Reddit API and returns a list
containing the titles of all hot articles for a given subreddit.
If no results are found for the given subreddit, the function should
return None.
"""
import requests


def add_title(hot_list, hotposts_data):
    """ Adds title from hotposts_data to hot_list """
    if len(hotposts_data) == 0:
        return

    hot_list.append(hotposts_data[0]['data']['title'])
    hotposts_data.pop(0)
    add_title(hot_list, hotposts_data)

def recurse(subreddit, hot_list=[], after=None):
    """ Get Reddit API JSON request """

    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    header = {'User-Agent': 'Mozilla/5.0'}
    param = {'after': after}
    response = requests.get(url,
                            headers=header,
                            allow_redirects=False,
                            params=param)

    if response.status_code == 200:
        response_data = response.json()
        hotposts_data = response_data['data']['children']
        add_title(hot_list, hotposts_data)
        after = response_data['data']['after']
        if not after:
            return hot_list
        return recurse(subreddit, hot_list=hot_list, after=after)
    else:
        return None
