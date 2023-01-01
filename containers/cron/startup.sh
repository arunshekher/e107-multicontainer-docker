#!/bin/sh

# echo
echo "Starting startup.sh.."
# echo "*/3       *       *       *       *       php /var/www/e107/cron_test.php >> /var/log/cron/cron.log 2>&1" >> /etc/crontabs/root

cat <<EOT >> /etc/crontabs/root
*/3       *       *       *       *       php /var/www/scripts/cron-tests.php >> /var/log/cron/cron.log 2>&1
*       *       *       *       *       php /var/www/e107/cron.php token=5ecdf6b535fc08ac99dcc7b03d6c554536a91a6f >/dev/null 2>&1
EOT

# list
crontab -l

# run
crond -f