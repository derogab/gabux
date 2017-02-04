#! /bin/bash

echo "Gabux > Convert"

sudo apt-get install ffmpeg # install required library

MODE = $1
INPUT = $2
OUTPUT = $3

case "$MODE" in
"avi-to-mp4")
    sudo ffmpeg -i $INPUT -vcodec mpeg4 -acodec ac3 -ar 48000 -ab 192k $OUTPUT

    ;;
"mkv-to-mp4")
    sudo ffmpeg -i $INPUT -vcodec copy -acodec copy $OUTPUT

    ;;
"3")
    #something

    ;;
"4")
    #something

;;
"5")
    #something

;;
*)
    #something
    ;;
esac

echo "Completed."
