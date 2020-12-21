#!/usr/bin/sh

echo "
--Initializing container--
User uid: $(id -u cronuser)
User gid: $(id -g cronuser)
Cron: $CRON
vdirsyncer config location: $VDIRSYNCER_CONFIG
"

crontab -u cronuser -d # Delete any existing crontab.
echo "$CRON sh /src/sync >> /dev/stdout 2>&1" >/tmp/crontab.tmp
crontab -u cronuser /tmp/crontab.tmp
rm /tmp/crontab.tmp

crond -l 6 -f
