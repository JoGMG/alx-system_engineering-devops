#!/usr/bin/python3
"""
A function that queries the Reddit API and returns the number of
subscribers (not active users, total subscribers) for a given subreddit.
If an invalid subreddit is given, the function should return 0.
"""
import requests


def number_of_subscribers(subreddit):
    """ Get Reddit API JSON request """

    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    header = {'User-Agent': 'Mozilla/5.0'}
    respone = requests.get(url, headers=header, allow_redirects=False)

    if respone.status_code == 200:
        respone_data = respone.json()
        subscribers_data = respone_data['data']['subscribers']
        if 'data' not in respone_data:
            return 0
        if 'subscribers' not in respone_data['data']:
            return 0
        return subscribers_data
    else:
        return 0
