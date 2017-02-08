#! /bin/bash

echo "Gabux > Update"

# Dependencies
sudo apt intall curl # curl is required to verify version
sudo apt install jq # jq is required to verify version
sudo apt install git # git is required to download update file

# Control version.json
LAST=$(curl -s 'https://raw.githubusercontent.com/derogab/gabux/master/version.json' | jq -r '.version')
CURRENT=$(jq -r '.version' /usr/share/gabux/version.json)

if [[ $LAST != $CURRENT ]]; then
  # Update Gabux

  # Download gabux from github
  echo "Download last version of gabux.."
  sudo git clone https://github.com/derogab/gabux /tmp/gabux
  echo "Source downloaded."

  # Remove old commands and bin
  sudo rm -r /usr/share/gabux/bin
  sudo rm -r /usr/share/gabux/commands

  # Copy folder in the system
  echo "Installing sub-commands.."
  sudo cp -R /tmp/gabux /usr/share/
  echo "Sub-commands installed."

  # Create /bin
  echo "Creating temporary folders.."
  sudo mkdir /usr/share/gabux/bin
  echo "Temporary folders created."

  # Clean garbage
  echo "Almost done."
  sudo rm -r /tmp/gabux

  echo "Gabux successfully updated."
fi

echo "Gabux is updated to the latest version: $CURRENT"
