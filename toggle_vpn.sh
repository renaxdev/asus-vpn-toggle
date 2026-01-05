#!/bin/sh
LAST_ALLLED=$(nvram get AllLED)

while true; do
    CURRENT_ALLLED=$(nvram get AllLED)

    if [ "$CURRENT_ALLLED" != "$LAST_ALLLED" ]; then
        echo "Button pressed! AllLED von $LAST_ALLLED -> $CURRENT_ALLLED"
        logger "VPN Toggle: Button pressed!"

        VPN_STATUS=$(nvram get vpn_client5_state)

        if [ "$VPN_STATUS" = "2" ]; then
            service stop_vpnclient5
            logger "VPN stopped, LED on"
        else
            service start_vpnclient5
            logger "VPN started, LED off"
        fi

        LAST_ALLLED=$CURRENT_ALLLED
    fi

    sleep 1
done
