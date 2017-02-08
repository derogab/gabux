#! /bin/bash
echo "Gabux started by $USER."
echo "Gabux > Install"

# Install git to download gabux
sudo apt install git

# Download gabux from github
echo "Download last version of gabux.."
sudo git clone https://github.com/derogab/gabux /tmp/gabux
echo "Source downloaded."

# Copy folder in the system
echo "Installing sub-commands.."
sudo cp -R /tmp/gabux /usr/share/
echo "Sub-commands installed."

# Create /bin
echo "Creating temporary folders.."
sudo mkdir /usr/share/gabux/bin
echo "Temporary folders created."

# Create custom command
echo "Installing 'gabux' command.."
sudo chmod +x /tmp/gabux/gabux.sh
sudo cp /tmp/gabux/gabux.sh /usr/bin/gabux.sh
echo "Custom command installed."

# Clean garbage
echo "Almost done."
sudo rm -r /tmp/gabux

echo "Gabux successfully installed."
