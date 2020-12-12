#!/usr/bin/sh

crontab -d # Delete any existing crontab.
echo "$CRON sh /src/sync >> /dev/stdout 2>&1" >/tmp/crontab.tmp
crontab /tmp/crontab.tmp
rm /tmp/crontab.tmp

crond -l 6 -f
