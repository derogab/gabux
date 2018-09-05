#! /bin/bash
echo "Updating your OS..";
sudo apt-get update -y;
sudo apt-get upgrade -y;
sudo apt-get autoremove -y;
exit;
