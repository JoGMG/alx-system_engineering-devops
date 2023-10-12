#!/usr/bin/python3
"""
A recursive function that queries the Reddit API, parses the
title of all hot posts, and prints a sorted count of given
keywords (case-insensitive, delimited by spaces. Javascript
should count as javascript, but java should not).
"""
import requests


def count_words(subreddit, word_list, word_count={}, after=None):
    """
    Prints a sorted count of given keywords present in titles
    of all hot posts of a given subreddit

    Arguments:
    -   subreddit: The subreddit to search in.
    -   word_list: The list containing the keywords to
                   search in the subreddit.
    -   word_count: The dictionary containing the keywords
                    and their count.
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
        response_data = response_data['data']['children']
        for item in response_data:
            title = item['data']['title'].lower().split()
            for word in word_list:
                if word.lower() in title:
                    count = len([value for value in title
                                 if value == word.lower()])
                    if word_count.get(word.lower(), None) is None:
                        word_count[word.lower()] = count
                    else:
                        word_count[word.lower()] += count

        if after is None:
            if len(word_count) == 0:
                return

            sorted_word_count = sorted(word_count.items(),
                                       key=lambda kv: kv[1], reverse=True)
            [print("{}: {}".format(key, value))
             for key, value in sorted_word_count]
        else:
            count_words(subreddit, word_list, word_count, after)
    else:
        return
