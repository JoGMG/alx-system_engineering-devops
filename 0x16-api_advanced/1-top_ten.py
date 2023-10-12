#!/usr/bin/python3
"""
A function that queries the Reddit API and prints the
titles of the first 10 hot posts listed for a given subreddit.
"""
import requests


def top_ten(subreddit):
    """
    Prints the titles of the first 10 hot posts of a given subreddit.

    Arguments:
    -   subreddit: The subreddit to search in.
    """

    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    header = {'User-Agent': 'Mozilla/5.0'}
    param = {'limit': 10}
    response = requests.get(url,
                            headers=header,
                            allow_redirects=False,
                            params=param)

    if response.status_code == 200:
        response_data = response.json()
        hotposts_data = response_data['data']['children']
        for post in hotposts_data:
            print(post['data']['title'])
    else:
        print(None)
