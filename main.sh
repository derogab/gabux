#!/bin/bash
echo "Gabux started by $USER.";

case "$1" in # $1 is the command.
"update") # update gabux
    bash /usr/share/gabux/update.sh;
    ;;
"uninstall") # uninstall gabux
    bash /usr/share/gabux/uninstall.sh;
    ;;
*)
    if [ -f "/usr/share/gabux/commands/$1/$1.sh" ]; then
      # File exists
      bash /usr/share/gabux/commands/$1/$1.sh $@;
    else
      # Commands not found
      echo "$1: command not found.";
    fi
    ;;
esac

echo "Gabux executed your command.";
echo "Bye $USER.";
exit;
