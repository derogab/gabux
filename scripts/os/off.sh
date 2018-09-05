#! /bin/bash

# $1 is the command 'os'
# $2 is the command 'poweroff'
# $3 is the time to wait before the shutdown
if [ -z "$3" ]; then
  # $3 is unset
  TIME="now";
else
  # $3 is set
  TIME=$3;
fi
# Shutdown
sudo shutdown -t $3;
exit;
