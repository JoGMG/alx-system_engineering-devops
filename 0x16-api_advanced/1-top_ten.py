#!/usr/bin/python3
"""
A function that queries the Reddit API and prints the
titles of the first 10 hot posts listed for a given subreddit.
"""
import requests


def top_ten(subreddit):
    """ Get Reddit API JSON request """

    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    param = {'limit': 10}
    response = requests.get(url, allow_redirects=False, params=param)

    response_data = response.json()
    if response.status_code == 200:
        hotposts_data = response_data['data']['children']
        if len(hotposts_data) == 0:
            print(None)
        else:
            for post in hotposts_data:
                print(post['data']['title'])
    else:
        print(None)
