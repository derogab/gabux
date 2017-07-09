#! /bin/bash
echo "Gabux started by $USER."
echo "Installing gabux.."

# Git is required to install gabux
dpkg -l | grep -qw git || sudo apt install git

# Download gabux from github
echo "Downloading last version of gabux.."
sudo git clone https://github.com/derogab/gabux.git /tmp/gabux
echo "Source downloaded."

# Copy folder in the system
sudo cp -R /tmp/gabux /usr/share/
echo "Sub-commands installed."

# Create /bin
sudo mkdir /usr/share/gabux/bin
echo "Temporary folders created."

# Create custom command
sudo chmod +x /tmp/gabux/gabux.sh
sudo cp /tmp/gabux/gabux.sh /usr/bin/gabux
echo "Custom command installed."

# Clean garbage
echo "Almost done."
sudo rm -r /tmp/gabux

echo "Gabux successfully installed."
