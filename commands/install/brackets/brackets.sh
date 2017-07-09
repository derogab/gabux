#!/bin/bash
# Source: http://brackets.io/

# Add required repository
sudo add-apt-repository ppa:webupd8team/brackets;
sudo apt-get update;

# Install
sudo apt-get install brackets;

echo "Completed.";
exit;
