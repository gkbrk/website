import requests
import random
import math

def get_streams(category):
    return requests.get("http://api.twitch.tv/kraken/streams?limit=20&offset=0&game=%s&broadcaster_language=&on_site=1" % category).json()["streams"]

def get_channel(name):
    return requests.get("https://api.twitch.tv/kraken/streams/%s" % name).json()["stream"]

def get_random_channel(streams):
    return random.choice(streams)