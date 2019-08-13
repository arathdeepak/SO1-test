#!/bin/sh
  
hostname;
sudo -i; #Switch as a user who has read permision on the log file

Value=$(cat /var/log/elastic/*.log | grep "Handbill not printed" | wc -l)  #Choose correct logfile

if [ $Value -ge 3 ]
then
echo "Critical Alert"
fi

## Alerting can be mail or this $Value can be sent to alerting tools to trigger an ALERT (Slack channels, phone calls, SMS, etc)
