#! /bin/bash
echo "Checking updates for your OS..";
IFS=';' read updates security_updates < <(/usr/lib/update-notifier/apt-check 2>&1);
if (( $updates == 0 )); then
    echo "No updates are available.";
else
    echo "There are updates available: $updates updates; $security_updates security updates.";
    sudo apt-get update -y;
    sudo apt-get upgrade -y;
    sudo apt-get autoremove -y;
fi
echo "The system is updated.";
exit;