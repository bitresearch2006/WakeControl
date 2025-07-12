#!/bin/bash

if [ -f /tmp/disable_wakeup ]; then
    echo "Wakeup script disabled." >> /var/log/schedule_wakeup.log
    exit 0
fi

WAKE_TIME=$(date -d 'tomorrow 10:00' +%s)
echo "Scheduling wake-up at $(date -d @$WAKE_TIME)"

# Set RTC and power off
rtcwake -m off -t $WAKE_TIME
