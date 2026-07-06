#!/bin/bash

# Instalar cron
apt-get update -qq && apt-get install -y cron -qq

# Criar crontab
echo "0 7 * * * python3 /app/scheduled_list_of_employees_linux.py >> /var/log/cron.log 2>&1" > /etc/cron.d/list-of-employees
echo "0 10 * * * python3 /app/scheduled_list_of_employees_linux.py >> /var/log/cron.log 2>&1" >> /etc/cron.d/list-of-employees
echo "30 15 * * * python3 /app/scheduled_list_of_employees_linux.py >> /var/log/cron.log 2>&1" >> /etc/cron.d/list-of-employees
echo "30 23 * * * python3 /app/scheduled_list_of_employees_linux.py >> /var/log/cron.log 2>&1" >> /etc/cron.d/list-of-employees

chmod 0644 /etc/cron.d/list-of-employees
crontab /etc/cron.d/list-of-employees

# Iniciar cron em background
cron

# Manter container vivo e mostrar logs
touch /var/log/cron.log
tail -f /var/log/cron.log
