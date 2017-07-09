#!/bin/bash

# Dependencies
dpkg -l | grep -qw curl || sudo apt-get install curl; # curl is required to verify version
dpkg -l | grep -qw jq || sudo apt-get install jq; # jq is required to verify version
dpkg -l | grep -qw git || sudo apt-get install git; # git is required to download update file

# Control version.json
LAST=$(curl -s 'https://raw.githubusercontent.com/derogab/gabux/master/version.json' | jq -r '.version');
CURRENT=$(jq -r '.version' /usr/share/gabux/version.json);

echo "Checking last version of gabux..";
if [ "$LAST" != "$CURRENT" ]; then
  # Update Gabux

  # Download gabux from github
  echo "Downloading last version of gabux..";
  sudo git clone https://github.com/derogab/gabux /tmp/gabux;
  echo "Source downloaded.";

  # Remove old commands and bin
  sudo rm -r /usr/share/gabux/bin;
  sudo rm -r /usr/share/gabux/commands;

  # Copy folder in the system
  sudo cp -R /tmp/gabux /usr/share/;
  echo "Sub-commands installed.";

  # Create /bin
  sudo mkdir /usr/share/gabux/bin;
  echo "Temporary folders created.";

  # Clean garbage
  echo "Almost done.";
  sudo rm -r /tmp/gabux;

  echo "Gabux successfully updated.";
fi

echo "Gabux is updated to the latest version: $LAST";
