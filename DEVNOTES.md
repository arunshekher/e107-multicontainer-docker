## Todo

- [ ] move the site enabled config to Dockerfile
- [x] need to add xdebug
- [x] need to add a filesystem container with git and ssh
- [x] install msmtp for mailhog
- [x] create an ssh git container for phpstorm to access remotely so use a full blown os
- [x] change mariadb version to a fixed on rather than later that can break things in future.
- [x] add php logs
- [x] add mysql logs
- [ ] add xdebug configuration
- [ ] cleanup and optimize all Dockerfiles
- [ ] consider using Makefile
- [ ] make use of a shell script to initialize docker-compose
- [ ] write the README.md
- [ ] add arguments in Dockerfiles - php, cron etc to allow diff php versions
- [ ] remove old commented out code from cron startup.sh shell script
- [ ] update of remove the msmtprc file in the containers/mailhog directory
- [x] add 'ServerName' in the virtual host conf file
- [ ] research and add mailhog logs
- [x] Add PHP 8.0 Dockerfile
- [ ] Try to implement PHP-FPM 
- [x] install PHPunit - installing globally is not recommended
- [x] add PHP 5.6
- [ ] add possibility to declare e107 cron script in .env file and use that in crontab file upon docker-compose up
- [ ] move the cron declarations to crontab rather than the shell script and add an example version (crontab.example )in the repo 
- [ ] let the cron container also use the php version declared in the .env file


## Notes
1. `cat /etc/os-release` to see the distro used by the container image; in an attached terminal
    - mailhog image - Alpine Linux v3.12
    - php-apache image - Debian GNU/Linux 11 (bullseye), Debian GNU/Linux 9 (stretch)
    - mariadb image - Ubuntu 22.04.1 LTS
    - crond image - Alpine Linux v3.17
2. Send mail with msmtp on terminal :
    ```console    
    echo -e "Subject: Test Mail\r\n\r\nThis is a test mail, 
    let me know if this works" | msmtp --debug --from from@yourdomain.com -t to@someone.com
    ```
3. Send mail with PHP on terminal: 
    ```console    
    php -r "mail('to@domain.com','Test Mail from PHP', 
    'This is a test mail from PHP, let me know if this works');"
    ```
4. SO: `sendmail_path = "/usr/bin/msmtp -C /etc/msmtprc -t --read-envelope-from"` <-- doesn't work

5. Install PHPunit using something like below in Dockerfile:
    ```console
    RUN wget -O phpunit https://phar.phpunit.de/phpunit-9.phar
    RUN chmod +x phpunit && mv phpunit /usr/local/bin/phpunit
    RUN phpunit --version
    ```
6. 