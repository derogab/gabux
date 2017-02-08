#! /bin/bash

echo "Gabux started by $USER."

case "$1" in # $1 is the command.
"convert") #convert files
    sh commands/convert/convert.sh $2 $3 $4 #params: MODE, INPUT, OUTPUT
    ;;
"linux-update") #update linux system
    sh commands/update/update.sh
    ;;
"update") # update gabux
    sh update.sh
    ;;
"xxx")
    #something
    ;;
"xxx")
    #something
    ;;
"xxx")
    #something
    ;;
"xxx")
    #something
    ;;
"xxx")
    #something
    ;;
*)
    #something
    ;;
esac

echo "Bye :)"
