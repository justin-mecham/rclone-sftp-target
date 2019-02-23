#!/bin/bash
u=$PAM_USER
export PATH='/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin'

if mountpoint -q /home/$u/shared
then
  echo "mounted"
else
  echo "setup rclone for $u"
  mkdir -p /home/$u/shared
  chown $u /home/$u/shared
  cmd="rclone --daemon --config=/rclone.conf mount ubuntu1-backblaze:jmecham-rclone-test1/$u /home/$u/shared --allow-other --vfs-cache-mode writes"
  $cmd
fi
