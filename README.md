keep the script to rtc enable for server wakeup: /usr/local/sbin/schedule_wakeup.sh

set executable: sudo chmod +x /usr/local/sbin/schedule_wakeup.sh

Set cron job for shutdown the server at 6:00 PM and call the schedule_wakeup.sh

sudo crontab -e

0 18 * * * /usr/local/sbin/schedule_wakeup.sh && /sbin/shutdown -h now

Commands

git clone https://github.com/bitresearch2006/WakeControl.git

cd WakeControl

cp -f schedule_wakeup.sh /usr/local/sbin/schedule_wakeup.sh

sudo chmod +x /usr/local/sbin/schedule_wakeup.sh

sudo crontab -e

0 18 * * * /usr/local/sbin/schedule_wakeup.sh
