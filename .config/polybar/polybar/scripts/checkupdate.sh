#!/usr/bin/env bash
# checkupdates.sh
# Tommy Janna
# Modified original script created by @siduck76 (https://github.com/siduck76/xbps-updates)

UPD_ICON=""

# Show updates vs installs
# updates=$(xbps-install -un | cut -d' ' -f2 | sort | uniq -c | xargs)
updates=$(xbps-install -un | wc -l)

if [[ $updates == 0* ]]
then
    echo "System is up to date."
else
    if [[ $updates == 1* ]]
    then
        echo "$UPD_ICON $updates update"
    else
        echo "$UPD_ICON $updates updates"
    fi
fi
