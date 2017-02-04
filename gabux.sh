#! /bin/bash

echo "Gabux started by $USER."

COMMAND = $1

case "$COMMAND" in
"convert")
    sh commands/convert/convert.sh $2 $3 $4 #params: MODE, INPUT, OUTPUT
    ;;
"linux-update")
    sh commands/update/update.sh
    ;;
"3")
    #something
    ;;
*)
    #something
    ;;
esac

echo "End"
