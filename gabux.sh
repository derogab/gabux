#!/bin/bash
case "$1" in # $1 is the command.

"help") # help info
    echo "How to use Gabux?";

    # Syntax
    echo "Syntax: gabux {COMMAND} {PARAMS}";

    # Print list of commands
    # Gabux commands
    echo "Gabux Commands:
    - help: get some helps.
    - version: get current gabux version.
    - update: update gabux to the last version.";
    # OS commands
    echo "OS Commands:
    - os update: update linux packages.
    - os install {PACKAGE}: install {PACKAGE}.
    - os off {TIME}: shutdown the system after {TIME} seconds."
    # Utils commands
    echo "Utils commands:
    - utils convert {MODE} {INPUT} {OUTPUT}: convert file.";
    exit;
    ;;

"version") # version info
    # Dependencies
    dpkg -l | grep -qw jq || sudo apt-get install jq; # jq is required to verify version
    # Control version.json
    VERSION=$(jq -r '.version' /usr/share/gabux/version.json);
    # Print version of gabux
    echo "Gabux $VERSION";
    exit;
    ;;

"update") # update gabux
    # Dependencies
    dpkg -l | grep -qw curl || sudo apt-get install curl; # curl is required to verify version
    dpkg -l | grep -qw jq || sudo apt-get install jq; # jq is required to verify version
    dpkg -l | grep -qw git || sudo apt-get install git; # git is required to download update file

    # Control version.json
    LAST=$(curl -s 'https://raw.githubusercontent.com/derogab/gabux/master/version.json' | jq -r '.version');
    CURRENT=$(jq -r '.version' /usr/share/gabux/version.json);

    echo "Checking last version of gabux..";
    if test "$(printf '%s\n' "$CURRENT" "$LAST" | sort -V | head -n 1)" != "$LAST"; then # New gabux version

        # Download gabux from github
        echo "Downloading last version of gabux..";
        sudo git clone https://github.com/derogab/gabux /tmp/gabux;
        # Remove old version
        sudo rm -r /usr/share/gabux;
        # Copy folder in the OS
        sudo cp -R /tmp/gabux /usr/share/;
        # Create /bin
        sudo mkdir /usr/share/gabux/bin;
        # Install gabux in the OS
        sudo ln -sf /usr/share/gabux/gabux.sh /usr/bin/gabux;
        sudo chmod +x /usr/bin/gabux;
        # Clean garbage
        sudo rm -r /tmp/gabux;

        echo "Gabux successfully updated.";
        
    fi

    echo "Gabux is updated to the latest version: $LAST";
    exit;
    ;;

"uninstall") # uninstall gabux
    echo "Removing gabux..";
    # Remove gabux
    sudo rm -r /usr/share/gabux; # remove gabux folder
    sudo rm -r /usr/bin/gabux; # remove gabux command
    echo "Gabux successfully removed.";
    echo "Today is a sad day.";
    exit;
    ;;

"os") # os functions
    case "$2" in # $2 is the sub-command.

    "update") # uninstall gabux
        bash /usr/share/gabux/scripts/os/update.sh;
        exit;
        ;;
    "install") # uninstall gabux
        bash /usr/share/gabux/scripts/os/install.sh $@;
        exit;
        ;;
    "off") # power off the system
        bash /usr/share/gabux/scripts/os/off.sh $@;
        exit;
        ;;
    esac
    
    exit;
    ;;

"utils") # utils functions
    
    case "$2" in # $2 is the sub-command.

    "convert") # uninstall gabux
        bash /usr/share/gabux/scripts/utils/convert.sh $@;
        exit;
        ;;

    esac
    
    exit;
    ;;

*) # default
    if [ ! -z "$1" ]; then
      # Commands not found
      echo "$1: command not found.";
    fi
    echo "write \"gabux help\" for more informations.";
    ;;
esac

echo "Bye $USER.";
exit;
