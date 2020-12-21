#!/usr/bin/sh

addgroup -g "$GID" cronuser
adduser -D -u "$UID" -G cronuser cronuser
addgroup cronuser tty
chown cronuser /src

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
