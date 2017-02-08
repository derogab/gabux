#! /bin/bash

echo "Gabux started by $USER."

case "$1" in # $1 is the command.
"convert") #convert files
    sh /usr/share/gabux/commands/convert/convert.sh $2 $3 $4 #params: MODE, INPUT, OUTPUT
    ;;
"linux-update") #update linux system
    sh /usr/share/gabux/commands/update/update.sh
    ;;
"update") # update gabux
    sh /usr/share/gabux/update.sh
    ;;
"xxx")
    #something
    ;;
*)
    #something
    ;;
esac

echo "Bye :)"
