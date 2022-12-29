#!/bin/sh

# echo
echo "Starting startup.sh.."
# echo "*/3       *       *       *       *       php /var/www/e107/cron_test.php >> /var/log/cron/cron.log 2>&1" >> /etc/crontabs/root

cat <<EOT >> /etc/crontabs/root
*/3       *       *       *       *       php /var/www/cron_test.php >> /var/log/cron/cron.log 2>&1
*/5       *       *       *       *       php /var/www/e107/cron.php >> /var/log/cron/cron.log 2>&1
line 2
EOT

# list
crontab -l

# run
crond -f