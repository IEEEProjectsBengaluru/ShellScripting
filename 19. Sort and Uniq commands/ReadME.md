# Sort and Uniq commands

## Steps

- Lets see how sort command works on a file
  - $ cat /etc/passwd
  - $ sort /etc/passwd
  - $ sort -r /etc/passwd # reverse the orders
- Lets sort the numbers, uid from etc passwd
  - $ cat -d ‘:’ -f 3 /etc/passwd | sort
  - $ cat -d ‘:’ -f 3 /etc/passwd | sort -n
- Lets see the storage usages of some directories
  - $ sudo du /var | sort -n
  - $ sudo du -h /var | sort -h
- Lets sort the ports that we have seen in last session
  - $ netstat -nutl | grep ‘:’ | awk ‘{print $4}’ | awk -F ‘:’ ‘{print $NF}’ | sort -n
  - $ netstat -nutl | grep ‘:’ | awk ‘{print $4}’ | awk -F ‘:’ ‘{print $NF}’ | sort -nu
  - $ netstat -nutl | grep ‘:’ | awk ‘{print $4}’ | awk -F ‘:’ ‘{print $NF}’ | sort -n | uniq # uniq requires sorted input
  - $ netstat -nutl | grep ‘:’ | awk ‘{print $4}’ | awk -F ‘:’ ‘{print $NF}’ | sort -n | uniq -c # To get the unique instances count
- Lets get the how many syslog messages that program is generating
  - $ sudo cat /var/log/messages
  - $ sudo cat /var/log/messages | awk ‘{print $5}’ | sort | uniq -c | sort -n
- Lets see an example to sort by using keys
  - $ cat /etc/passwd
  - $ cat /etc/passwd | sort -t ‘:’ -k 3 -n # sorted based on uids
- Lets see an example on how to analyse the webserver logs to know how may times a particular URL is visited
  - $ cd /vagrant
  - $ cat access\_log
  - $ cut -d ‘”’ -f 2 access\_log
  - $ cut -d ‘”’ -f 2 access\_log | cut -d ‘ ‘ -f 2
  - $ cut -d ‘”’ -f 2 access\_log | cut -d ‘ ‘ -f 2 | sort | uniq -c | sort -n
  - $ cut -d ‘”’ -f 2 access\_log | cut -d ‘ ‘ -f 2 | sort | uniq -c | sort -n | tail 3
- Lets create a script for the same
  - #Display the top three most visited URLs for a given web server log file.
  - LOG\_FILE="${1}"
  - if [[ ! -e "${LOG\_FILE}" ]]
  - then
  - echo "Cannot open ${LOG\_FILE}" >&2
  - exit 1
  - fi
  - cut -d '"' -f 2 ${LOG\_FILE} | cut -d ' ' -f 2 | sort | uniq -c | sort -n | tail -3
- Save and run
  - $ ./accessLogs.sh access\_log