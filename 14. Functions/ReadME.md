# Functions

Functions is a group of commands that can be called using a single name in a script. Let’s create a function called log that will end up logging messages to the system log and optionally displaying those messages to the users executing the script.

## Functions with no input arguments

- To get help of function execute $ help function
- Create a new shel script myfunc.sh
  - log (){
  - echo ‘ you called the log function!’
  - }
  - log
- You need to define the function first before calling the function.
- Save and run
  - $ ./myfunc.sh
- You can also define the function by calling function keyword in the begining
  - function log {
  - ` `echo ‘ you called the log function!’
  - }
  - log
- Save and run
  - $ ./myfunc.sh

## Functions with input arguments

- Lets see how we can pass arguments to the function,
  - log (){
  - local MESSAGE=”${@}”
  -  echo “${MESSAHR}”
  - }
  - log ‘Hello!’
  - log ‘This is fun’
- local – makes a vairable local to a function. This can be only used inside a function
- Save and run
  - $ ./myfunc.sh

## Functions with input arguments and global variables

- Now lets modify the function to display the message if the global variable verbose is set to true
  - log (){
  - local MESSAGE=”${@}”
  - if [[ “${VERBOSE} = ‘true’ ]]
  - then
  -   echo “${MESSAGE}”
  - fi
  - }

  - log ‘Hello!’
  - VERBOSE=’true’
  - log ‘This is fun’
- Save and run
  - $ ./myfunc.sh
- User readonly to avoid the functions change the global variable value
  - log (){
  - local MESSAGE=”${@}”
  - if [[ “${VERBOSE} = ‘true’ ]]
  - then
  -   echo “${MESSAGE}”
  - fi
  - }

  - readonly VERBOSE=’true’
  - log ‘Hello!’
  - log ‘This is fun’

## Logger command

- Logger makes entries in the system log (syslog).
- logger is a executable $ type -a logger $ man logger
- Lets try a quick example of using logger command
  - $ logger ‘Hello from the command line!’
  - $ sudo tail /var/log/messages
- Lets add logger functionality in the script
  - log() {
  - #This function sends a message to syslog and to standard output if VERBOSE is true.
  - local MESSAGE="${@}"
  - if [[ "${VERBOSE}" = 'true' ]]
  - then
  - echo "${MESSAGE}"
  - fi
  - logger -t myfunc.sh "${MESSAGE}"
  - }
  - readonly VERBOSE='true'
  - log 'Hello!'
  - log 'This is fun!'
- Save and run
  - $ ./myfunc.sh
  - $ sudo tail /var/log/messages


## Another function to back up files

- Create a function to back the files in /var/tmp/ folder. The files present in /var/tmp will survive reboot where as /tmp is not gauranteed to survive reboot. But all these tmp files are deleted depending on OS and other conditions.
  - backup\_file() {
  - #This function creates a backup of a file.  Returns non-zero status on error.
  - local FILE="${1}"
  - #Make sure the file exists.
  - if [[ -f "${FILE}" ]]
  - then
  - local BACKUP\_FILE="/var/tmp/$(basename ${FILE}).$(date +%F-%N)"
  - log "Backing up ${FILE} to ${BACKUP\_FILE}."
  - #The exit status of the function will be the exit status of the cp command.
  - cp -p ${FILE} ${BACKUP\_FILE}
  - else
  - #The file does not exist, so return a non-zero exit status.
  - return 1
  - fi
  - }
- cp -p -> preserves the timestamps and file permissions


## Creating a script

- Add both the functions in myfun.sh and add following lines.
  - #Make a decision based on the exit status of the function.
  - #Note this is for demonstration purposes.  You could have
  - #put this functionality inside of the backup\_file function.
  - if [[ "${?}" -eq '0' ]]
  - then
  - log 'File backup succeeded!'
  - else
  - log 'File backup failed!'
  - exit 1
  - fi
