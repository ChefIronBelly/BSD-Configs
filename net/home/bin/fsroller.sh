#!/usr/pkg/bin/mksh

EXCLUDES="/etc/fs_excludes"

if ! [ -f $EXCLUDES ] ; then
cat > "$EXCLUDES" << EOF
- /dev/*
- /cdrom/*
- /mnt/*
- /proc/*
- /tmp/*
- /home/chef/Pictures
- /home/chef/Video
- /home/chef/Downloads
- /home/chef/Music
- /home/chef/Source
- /home/chef/.cache
EOF
chmod 666 "$EXCLUDES"
fi

echo "I: Copying File System, please wait"
rsync -av / /tmp/target/ --exclude-from="$EXCLUDES" >/dev/null 2>&1
# rsync -a --delete --exclude={".cache/*","Downloads/*","Video/*","Music/*"} "$HOME" /tmp/backup
echo "I: Success. File System copied."
echo
echo "I: Compressing File System. please wait"
cd /tmp/target && sudo tar -czf /tmp/backup.tar.gz .
echo "I: File System Compressed."
echo
rm "$EXCLUDES"
