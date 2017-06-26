#! /bin/bash
echo "Gabux > Update"
IFS=';' read updates security_updates < <(/usr/lib/update-notifier/apt-check 2>&1);
if (( $updates == 0 )); then
    echo "No updates are available."
else
    echo "There are updates available: $updates updates; $security_updates security updates."
    sudo apt update;
    sudo apt upgrade;
    sudo apt autoremove;
fi
echo "The system is updated.";
