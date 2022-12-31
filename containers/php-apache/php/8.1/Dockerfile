#Debian GNU/Linux 11 (bullseye)
FROM php:8.1-apache 

RUN a2enmod rewrite

RUN apt-get update && apt-get install -y git unzip zip msmtp curl wget tar

WORKDIR /var/www/e107

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions gd pdo_mysql bcmath zip intl opcache exif xdebug

COPY --from=composer:2.0 /usr/bin/composer /usr/local/bin/composer


# for mailhog - todo: might need to move up to prevent exit
RUN echo "sendmail_path=/usr/bin/msmtp -t\n"\
>> /usr/local/etc/php/conf.d/php-sendmail.ini

# for mailhog - todo: might need to move up to prevent exit
# RUN echo "host mailhog\nport 1025\n"\
# >> /etc/msmtprc

RUN echo "host mailhog\n\
port 1025\n\
from 'user@domain.com'\n\
logfile /var/log/msmtp.log" >> /etc/msmtprc

# one more way to print new lines to file
# arr=( 'line 1' 'line 2' );
# printf '%s\n' "${arr[@]}" >> greetings.txt

# sendmail symbolic link to msmtp
RUN ln -s /usr/bin/msmtp /usr/sbin/sendmail

# install phpunit globally
RUN wget -O phpunit https://phar.phpunit.de/phpunit-9.phar
RUN chmod +x phpunit && mv phpunit /usr/local/bin/phpunit
RUN phpunit --version

# todo: add xdebug and sshd also in this container

