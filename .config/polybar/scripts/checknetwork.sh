#!/usr/bin/env bash
# checknetwork.sh
# Tommy Janna
# Modified original script created by Aditya Shakya @adi1090x

count=0
disconnected=""
disconnected2=""
disconnected3=""
disconnected4=""
wireless_connected=""
ethernet_connected=""

ID="$(ip link | awk '/state UP/ {print $2}')"

while true; do
    if (ping -c 1 voidlinux.org || ping -c 1 fsf.org || ping -c 1 archlinux.org || ping -c 1 debian.org) &>/dev/null; then
        if [[ $ID == e* ]]; then
            echo "$ethernet_connected" ; sleep 10
        else
            echo "$wireless_connected" ; sleep 10
        fi
    else
        echo "$disconnected" ; sleep 1
        echo "$disconnected2" ; sleep 1
        echo "$disconnected3" ; sleep 1
        echo "$disconnected4" ; sleep 1
    fi
done
