#!/bin/bash

WAKE_TIME=$(date -d 'tomorrow 10:00' +%s)
echo "Scheduling wake-up at $(date -d @$WAKE_TIME)"

# Set RTC and power off
rtcwake -m off -t $WAKE_TIME
