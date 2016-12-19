#! /bin/bash

echo "Gabux started by $USER."

COMMAND = $1

case "$COMMAND" in
"convert")
    MODE = $2
    INPUT = $3
    OUTPUT = $4
    
    ;;
"2")
    #something
    ;;
*)
    #something
    ;;
esac

echo "End"
