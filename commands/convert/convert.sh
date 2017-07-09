#! /bin/bash
echo "Converting.."

dpkg -l | grep -qw ffmpeg || sudo apt-get install ffmpeg # install required library

# $1 is the command 'convert'
# $2 is the mode of the conversion.
# $3 is the input file.
# $4 is the output file.

case "$2" in
"avi-to-mp4")
    sudo ffmpeg -i $3 -vcodec mpeg4 -acodec ac3 -ar 48000 -ab 192k $4

    ;;
"mkv-to-mp4")
    sudo ffmpeg -i $3 -vcodec copy -acodec copy $4

    ;;
"3")
    #something

    ;;
*)
    #something
    ;;
esac

echo "Conversion completed."
