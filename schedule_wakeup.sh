#!/bin/bash

export TZ=Asia/Kolkata
# Debug flag (set to 1 to enable logging)
DEBUG=1
LOGFILE="/var/log/schedule_wakeup.log"

log() {
    if [ "$DEBUG" -eq 1 ]; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') : $1" >> "$LOGFILE"
    fi
}

log "Wakeup script triggered by cron."

# Check for disable flag
if [ -f /tmp/disable_wakeup ]; then
    log "Wakeup script disabled via /tmp/disable_wakeup."
    exit 0
fi

# Schedule wake-up time
WAKE_TIME=$(date -d 'tomorrow 10:00' +%s)
log "Scheduling RTC wake-up at: $(date -d @$WAKE_TIME)"

# Step 1: Set RTC wake time (no immediate suspend)
if rtcwake --local -m no -t "$WAKE_TIME"; then
	log "RTC wakeup set successfully."
else
	log "Failed to set RTC wake!"
	exit 1
fi

# Step 2: Wait to ensure alarm is armed
sleep 60
log "Slept for 1 mins after setting RTC."

# Step 3: Shut down the system
log "Shutting down the system now."
sudo shutdown -h now
