### Backup Workflow
1. Begin Run script install-dependencies.sh
2. Config rclone manual
   - location config : /root/.config/rclone/rclone.conf
   - rclone config create gdrive drive scope drive config_is_local false
3. Edit script backup for app1.
4. Copy script backup-app1.sh to /usr/bin/
5. Run script backup-app1.sh for to backup app1.
6. If need backup app2, repeat step 3-5.
7. Done!