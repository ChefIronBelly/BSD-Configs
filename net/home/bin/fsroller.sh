#!/usr/pkg/bin/mksh

EXCLUDES="/etc/fs_excludes"

if ! [ -f $EXCLUDES ] ; then
cat > "$EXCLUDES" << EOF
- /dev/*
- /cdrom/*
- /mnt/*
- /proc/*
- /tmp/*
EOF
chmod 666 "$EXCLUDES"
fi

echo "I: Copying File System, please wait"
rsync -av / /tmp/target/ --exclude-from="$EXCLUDES" >/dev/null 2>&1
echo
echo "I: Success. File System copied."
echo
echo "I: Compressing File System. please wait"
cd /tmp/target && sudo tar -czf /tmp/image.tar .
# xz -9 /tmp/image.tar > image.tar.xz 
echo
echo "I: File System Compressed."
rm "$EXCLUDES"
echo
