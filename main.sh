#! /bin/bash

echo "Gabux started by $USER."

case "$1" in # $1 is the command.
"update") # update gabux
    sh /usr/share/gabux/update.sh
    ;;
*)
    if [ -f "/usr/share/gabux/commands/$1/$1.sh" ]; then
      # File exists
      sh /usr/share/gabux/commands/$1/$1.sh $@
    else
      # Commands not found
      echo "gabux -> $1: command not found."
    fi
    ;;
esac

echo "Bye :)"
