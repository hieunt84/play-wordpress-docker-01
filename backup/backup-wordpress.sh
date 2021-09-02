# Script backup for many app on server to google drive
#!/bin/sh

# declare variable
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
SERVER_NAME=docker1
TIMESTAMP=$(date +"%F")
BACKUP_DIR="/home/backup/wordpress"
# folder need backup wordpress
APP_DIR="/home/wordpress"
SCRIPT_BK=/usr/bin/backup-wordpress.sh
APP_NAME="wordpress"
SECONDS=0

# Make folder backup for wordpress
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
fi

# Backup
cd "$BACKUP_DIR"
tar -czf backup-$(date +%F\-%H\-%M\-%S).tar.gz "$APP_DIR" >/dev/null 2>&1

# Keep the last 3 backups
find "$BACKUP_DIR" -type f -name "*.gz" -cmin +18 -delete

# cron and email
if [ ! -f /etc/cron.d/wordpress.cron ]; then
    cat > "/etc/cron.d/wordpress.cron" <<EOF
    SHELL=/bin/sh
    MAILTO="hieunt9@gmail.com"
    */5 * * * * root $SCRIPT_BK
EOF
    echo "Restarting crond service"
    systemctl restart crond.service
fi

# Backup on Google Drive
echo "Starting Uploading Backup on Google Drive "
rclone copy $BACKUP_DIR "remote:$SERVER_NAME/$TIMESTAMP/$APP_NAME" >> /var/log/rclone.log 2>&1

# Clean up Google Drive
rclone -q --min-age 2w delete "remote:$SERVER_NAME" #Remove all backups older than 2 week
rclone -q --min-age 2w rmdirs "remote:$SERVER_NAME" #Remove all empty folders older than 2 week
rclone cleanup "remote:" >/dev/null 2>&1 #Cleanup Trash
echo "Finished";
echo '';

duration=$SECONDS
echo "Total $size, $(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."