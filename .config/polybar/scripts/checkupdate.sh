#!/usr/bin/env bash
# checkupdates.sh
# Tommy Janna
# Modified original script created by @siduck76 (https://github.com/siduck76/xbps-updates)

UPD_ICON=""
updates=$(xbps-install -Sun | cut -d' ' -f2 | sort | uniq -c | xargs)

if [[ -z $updates ]]
then
    echo "System is up to date."
else
    if [[ $updates == 1* ]]
    then
        echo "$UPD_ICON $updates"
    else
        echo "$UPD_ICON $updates""s"
    fi
fi
