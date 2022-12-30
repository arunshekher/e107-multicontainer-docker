## Todo

- move the site enabled config to Dockerfile
- need to add xdebug
- need to add a filesystem container with git and ssh
- install msmtp for mailhog
- SO: sendmail_path = "/usr/bin/msmtp -C /etc/msmtprc -t --read-envelope-from" <-- doesn't work
- create an ssh git container for phpstorm to access remotely so use a full blown os
- change mariadb version to a fixed on rather than later that can break things in future.


## Notes
1. use cat /etc/os-release in the container terminal to see the os
    mailhog image is based on
    php-apache is based on debian bullseye
    mariadb container is based on Ubuntu 22.04.1 LTS
2. Send mail with msmtp directly:
`    echo -e "Subject: Test Mail\r\n\r\nThis is a test mail, 
let me know if this works" |msmtp --debug --from from@yourdomain.com -t to@someone.com`
3. Send mail with PHP CLI: 
`    php -r "mail('to@domain.com','Test Mail from PHP', 
'This is a test mail from PHP, let me know if this works');" `
4.