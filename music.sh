#!/bin/bash

video_url=$(ytfzf -L)
mpv --no-video "$video_url"
