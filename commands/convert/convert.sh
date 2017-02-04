#! /bin/bash

echo "Gabux > Convert"

sudo apt-get install ffmpeg # install required library

# $1 is the mode of the conversion.
# $2 is the input file.
# $3 is the output file.

case "$1" in 
"avi-to-mp4")
    sudo ffmpeg -i $2 -vcodec mpeg4 -acodec ac3 -ar 48000 -ab 192k $3

    ;;
"mkv-to-mp4")
    sudo ffmpeg -i $2 -vcodec copy -acodec copy $3

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
