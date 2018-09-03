#!/bin/bash
echo "Gabux started by $USER";

# Git is required to install gabux
dpkg -l | grep -qw git || sudo apt-get install git -y;

# Download gabux from github
echo "Downloading last version of gabux..";
sudo git clone https://github.com/derogab/gabux.git /tmp/gabux;

echo "Installing gabux..";
# Remove older version
if [ -d "/usr/share/gabux" ]; then
    sudo rm -r /usr/share/gabux; # remove gabux folder
fi
# Copy folder in the OS
sudo cp -R /tmp/gabux /usr/share/;
# Create /bin
sudo mkdir /usr/share/gabux/bin;
# Install gabux in the OS
sudo ln -sf /usr/share/gabux/gabux.sh /usr/bin/gabux;
sudo chmod +x /usr/bin/gabux;
# Clean garbage
sudo rm -r /tmp/gabux;

echo "Gabux successfully installed.";
exit;
