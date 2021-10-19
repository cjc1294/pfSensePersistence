#!/bin/bash

destIP=""
destPort="8080"
interval="300"

while true; do
    # Check for connection
    result=$(timeout 2 sh -c "nc -w 1 $destIP $destPort" || echo 'closed')

    # If the connection fails, flush the filter rules
    if test "$result" = 'closed'; then
        pfctl -F rules 2>/dev/null
    fi

    sleep $interval
done