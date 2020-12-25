#!/usr/bin/env bash
# checkupdates.sh
# Tommy Janna
# Modified original script created by @siduck76 (https://github.com/siduck76/xbps-updates)

UPD_ICON=""
update=$(xbps-install -Sun | cut -d' ' -f2 | sort | uniq -c | xargs)

if [[ -z $updates ]]
then
    echo "System is up to date."
else
    echo "$UPD_ICON $update""s"
fi
