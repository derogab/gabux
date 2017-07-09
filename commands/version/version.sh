#! /bin/bash

echo "Checking version of gabux.."

# Dependencies
dpkg -l | grep -qw jq || sudo apt-get install jq # jq is required to verify version

# Control version.json
VERSION=$(jq -r '.version' /usr/share/gabux/version.json)

# Print version of gabux
echo "Gabux version is $VERSION"
