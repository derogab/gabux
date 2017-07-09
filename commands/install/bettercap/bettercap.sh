#!/bin/bash
echo "Installing bettercap..";

# Source: https://www.bettercap.org

# Install required source
sudo apt-get install build-essential ruby-dev libpcap-dev;

# Install
sudo gem install bettercap;

echo "Completed.";
exit;
