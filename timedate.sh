#!/bin/sh
logger "Syncing time $(date +%F-%T)"
until timeout 30s ntpdate pool.ntp.org;
	do sleep 5
done
logger "Throttling network at $(date +%F-%T)"
# Throttle to 256Kbps up 128Kbps down
wondershaper wlan0 256 128
