#! /bin/bash
echo "Converting..";

# Dependencies
dpkg -l | grep -qw ffmpeg || sudo apt-get install ffmpeg -y; # install required library

# $1 is the command 'utils'
# $2 is the command 'convert'
# $3 is the mode of the conversion.
# $4 is the input file.
# $5 is the output file.

case "$3" in

"avi-to-mp4")
    sudo ffmpeg -i $4 -vcodec mpeg4 -acodec ac3 -ar 48000 -ab 192k $5;

    ;;

"mkv-to-mp4")
    sudo ffmpeg -i $4 -vcodec copy -acodec copy $5;

    ;;

*)
    #something
    ;;

esac

echo "Conversion completed.";
exit;
