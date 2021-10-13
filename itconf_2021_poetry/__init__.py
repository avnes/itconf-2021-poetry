import requests

from html import unescape
from requests import Response

__version__ = "0.1.0"


def get_joke():
    response: Response = requests.get("http://api.icndb.com/jokes/random")
    data: dict = response.json()
    error: str = "There are no Chuck Norris jokes/There is no spoon."
    if response.status_code == 200:
        return unescape(data.get("value", error).get("joke", error))
    elif response.status_code == 404:
        return error
