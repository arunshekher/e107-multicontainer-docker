#!/bin/sh

echo "Starting startup.sh.."
echo "*/3       *       *       *       *       php /var/www/e107/cron_test.php >> /var/log/cron/cron.log 2>&1" >> /etc/crontabs/root

crontab -l

crond -f