# Parsing Log Files

The goal of this exercise is to create a shell script that displays the number of failed login attempts by IP address and location.

## Steps

- Lets take a look at the sample data ‘syslog-sample’
  - $ cat syslog-sample
- Notice that there are failed attempts in the logging with root and without root
- Lets try to get he failed attempts logs
  - $ grep Failed syslog-sample
- Lets exclude root
  - $ grep Failed syslog-sample | grep -v root
- Lets use the keyword ‘from’ to extract the IP address
  - $ grep Failed syslog-sample | awk -f ‘from ’ ‘{print $2}’
- Lets try to get the first column which contain IP address
  - grep Failed syslog-sample | awk -f ‘from ’ ‘{print $2}’ | awk ‘{print $1}’
- We can also do this to get the IP address
  - $ grep Failed syslog-sample | awk ‘{print $(NF – 3)}’
- Lets use uniq commands to get the counts
  - $ grep Failed syslog-sample | awk ‘{print $(NF – 3)}’ | sort | uniq -c | sort -nr
- geoiplookup – will share the IP address location
  - $ geoiplookup 182.100.67.59
- Lets a new script show-attacker.sh
- Count the number of failed logins by IP address. If there are any IPs with over LIMIT failures, display the count, IP, and location.
  - LIMIT='10'
  - LOG\_FILE="${1}"
- Make sure a file was supplied as an argument.
  - if [[ ! -e "${LOG\_FILE}" ]]
  - then
  - echo "Cannot open log file: ${LOG\_FILE}" >&2
  - exit 1
  - fi
- Display the CSV header.
  - echo 'Count,IP,Location'
- Loop through the list of failed attempts and corresponding IP addresses.
- grep Failed ${LOG\_FILE} | awk '{print $(NF - 3)}' | sort | uniq -c | sort -nr |  while read COUNT IP
  - do
  - #If the number of failed attempts is greater than the limit, display count, IP, and location.
  - if [[ "${COUNT}" -gt "${LIMIT}" ]]
  - then
  - LOCATION=$(geoiplookup ${IP} | awk -F ', ' '{print $2}')
  - echo "${COUNT},${IP},${LOCATION}"
  - fi
  - done
  - exit 0
