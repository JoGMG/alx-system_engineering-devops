#!/usr/bin/python3
"""
A function that queries the Reddit API and returns the number of
subscribers (not active users, total subscribers) for a given subreddit.
If an invalid subreddit is given, the function should return 0.
"""
import requests


def number_of_subscribers(subreddit):
    """
    Returns the total number of subscribers of a given subreddit.

    Arguments:
    -   subreddit: The subreddit to search in.
    """

    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    header = {'User-Agent': 'Mozilla/5.0'}
    respone = requests.get(url, headers=header, allow_redirects=False)

    if respone.status_code == 200:
        respone_data = respone.json()
        return respone_data['data']['subscribers']
    else:
        return 0
