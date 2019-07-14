#!/bin/bash

icon_enabled=""
icon_disabled=""
status=`systemctl is-active bluetooth.service`

if [ $status == "active" ]
then
    echo "%{F#00bcd4}$icon_enabled%{F-}"
else
    echo "$icon_disabled"
fi
