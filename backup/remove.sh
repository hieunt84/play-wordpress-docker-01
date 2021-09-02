#!/bin/sh

yum -y install postfix cyrus-sasl-plain mailx
rm -rf /etc/postfix/main.cf
rm -rf /etc/postfix/sasl_passwd