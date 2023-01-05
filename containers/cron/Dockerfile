ARG PHP_VERSION
# FROM php:8.1.13-cli-alpine3.17
FROM php:${PHP_VERSION}-cli-alpine


# add msmtp
RUN apk update && apk upgrade
RUN apk add --no-cache msmtp

# todo: need to install crond, and some php extensions like pdo mysqli etc
RUN docker-php-ext-install pdo pdo_mysql

# copy crontab 
# COPY crontab /etc/crontabs/root
# todo: i think this method of copying crontab 
# from a file is more userfriendly than setup.sh script

# copy startup
COPY startup.sh /usr/local/startup.sh
# make it executable
RUN chmod +x /usr/local/startup.sh

# create cron log directory and log
RUN mkdir /var/log/cron
RUN touch /var/log/cron/cron.log

# create a msmtp log directory and log
RUN mkdir /var/log/msmtp/
RUN touch /var/log/msmtp/msmtp.log

# msmtp config
COPY msmtprc /etc/msmtprc

# for mails to be forwarded to mailhog 
RUN echo "sendmail_path=/usr/bin/msmtp -t\n"\
>> /usr/local/etc/php/conf.d/php-sendmail.ini

# for mails to be forwarded to mailhog 
# RUN echo "host mailhog\nport 1025\nfrom 'user@domain.com'\n\
# logfile /var/log/msmtp/msmtp.log" >> /etc/msmtprc


# running for logging
# CMD ["crond", "-f"]

# CMD ["/usr/local/startup.sh", "&&", "crond", "-f", "-l", "8"]
# CMD ["crond", "-f", "-l", "8"]
# CMD ["crond","-f", "-L", "/dev/stdout"]
CMD ["/usr/local/startup.sh"]