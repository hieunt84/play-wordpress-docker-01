# play-wordpress

- Triển khai wordpress sử dụng docker

## Hướng dẫn
- Bước 1: Install Centos 7.9

- Bước 2: Install Docker
```
https://docs.docker.com/engine/install/centos/
```

- Bước 3: Install Docker compose
```
https://phoenixnap.com/kb/install-docker-compose-centos-7
```

- Bước 4: Clone source from github

- Bước 5: Run source code
```
  sudo docker compose up -d
  sudo docker compose ps
```

- Bước 6: Backup
```
- stop service.
- tar -czf backup-$(date +%F\-%H\-%M\-%S).tar.gz "/home/wordpress" >/dev/null 2>&1
- start service
```

- Bước 7: Restore
```
- stop service
- tar -xzf backupxxx
- cd ~/home
- cp -R wordpress /home
- start service
```

## Ghi chú
/var/spool/mail/root
check 3:45
