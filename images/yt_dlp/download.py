#!/bin/python

import os
import sys
import yt_dlp


OPTION = {
    "format": "bestvideo+bestaudio/best",
}


def main():
    try:
        url = sys.argv[1]
    except IndexError:
        raise BaseException("Need URL")

    ydl = yt_dlp.YoutubeDL(OPTION)
    ydl.download(url)


if __name__ == "__main__":
    main()

