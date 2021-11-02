#!/bin/bash

destIP=""
destPort="8080"
interval="300"

while true; do
    # Check for connection
    result=$(timeout 2 sh -c "nc -w 1 $destIP $destPort" || echo 'closed')

    # If the connection fails, flush the filter rules
    if test "$result" = 'closed'; then
        sed -n -i.tmp '/block/!p' /tmp/rules.debug
        rm /tmp/rules.debug.tmp 2>/dev/null
        sed -n -i.tmp '/reject/!p' /tmp/rules.debug
        rm /tmp/rules.debug.tmp 2>/dev/null
        pfctl -f /tmp/rules.debug
    fi

    sleep $interval
done