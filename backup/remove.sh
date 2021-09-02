#!/bin/sh

yum -y remove postfix cyrus-sasl-plain mailx
rm -rf /etc/postfix/main.cf
rm -rf /etc/postfix/sasl_passwd

rm -rf /usr/bin/backup-wordpress.sh
rm -rf /etc/cron.d/wordpress.cron