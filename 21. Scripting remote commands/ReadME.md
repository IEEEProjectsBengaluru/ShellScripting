**Scripting remote commands**

The goal of this exercise is to create a shell script that executes a given command on multiple servers.

**Steps**

- This requires multiple VMs to be configured in vagrant configuation file
- From your local machine cd to a file where you would want the script to be present
  - $ cd <dir>
  - $ mkdir multinet
  - $ cd multinet
- Initialise vagrant project
  - $ vagrant init jasonc/centos
- Edit the configuration to add admin and servers $ nano Vagrantfile
  - config.vm.define "admin01" do |admin01|
  - admin01.vm.hostname = "admin01"
  - admin01.vm.network "private\_network", ip: "10.9.8.10"
  - end
  - config.vm.define "server01" do |server01|
  - server01.vm.hostname = "server01"
  - server01.vm.network "private\_network", ip: "10.9.8.11"
  - end
  - config.vm.define "server02" do |server02|
  - server02.vm.hostname = "server02"
  - server02.vm.network "private\_network", ip: "10.9.8.12"
  - end
- Run $ vagrant up $ vagrant status
- Connect to admin account
  - $ vagrant ssh admin01
- Create a new shell script run-everywhere.sh
  - #A list of servers, one per line.
  - SERVER\_LIST='/vagrant/servers'

  - #Options for the ssh command.
  - SSH\_OPTIONS='-o ConnectTimeout=2'

  - usage() {
  - `  `#Display the usage and exit.
  - `  `echo "Usage: ${0} [-nsv] [-f FILE] COMMAND" >&2
  - `  `echo 'Executes COMMAND as a single command on every server.' >&2
  - `  `echo "  -f FILE  Use FILE for the list of servers. Default: ${SERVER\_LIST}." >&2
  - `  `echo '  -n       Dry run mode. Display the COMMAND that would have been executed and exit.' >&2
  - `  `echo '  -s       Execute the COMMAND using sudo on the remote server.' >&2
  - `  `echo '  -v       Verbose mode. Displays the server name before executing COMMAND.' >&2
  - `  `exit 1
  - }

  - #Make sure the script is not being executed with superuser privileges.
  - if [[ "${UID}" -eq 0 ]]
  - then
  - `  `echo 'Do not execute this script as root. Use the -s option instead.' >&2
  - `  `usage
  - fi

  - #Parse the options.
  - while getopts f:nsv OPTION
  - do
  - `  `case ${OPTION} in
  - `    `f) SERVER\_LIST="${OPTARG}" ;;
  - `    `n) DRY\_RUN='true' ;;
  - `    `s) SUDO='sudo' ;;
  - `    `v) VERBOSE='true' ;;
  - `    `?) usage ;;
  - `  `esac
  - done

  - #Remove the options while leaving the remaining arguments.
  - shift "$(( OPTIND - 1 ))"

  - #If the user doesn't supply at least one argument, give them help.
  - if [[ "${#}" -lt 1 ]]
  - then
  - `  `usage
  - fi

  - #Anything that remains on the command line is to be treated as a single command.
  - COMMAND="${@}"

  - #Make sure the SERVER\_LIST file exists.
  - if [[ ! -e "${SERVER\_LIST}" ]]
  - then
  - `  `echo "Cannot open server list file ${SERVER\_LIST}." >&2
  - `  `exit 1
  - fi

  - #Expect the best, prepare for the worst.
  - EXIT\_STATUS='0'

  - #Loop through the SERVER\_LIST
  - for SERVER in $(cat ${SERVER\_LIST})
  - do
  - `  `if [[ "${VERBOSE}" = 'true' ]]
  - `  `then
  - `    `echo "${SERVER}"
  - `  `fi

  - `  `SSH\_COMMAND="ssh ${SSH\_OPTIONS} ${SERVER} ${SUDO} ${COMMAND}"
 
  - `  `#If it's a dry run, don't execute anything, just echo it.
  - `  `if [[ "${DRY\_RUN}" = 'true' ]]
  - `  `then
  - `    `echo "DRY RUN: ${SSH\_COMMAND}"
  - `  `else
  - `    `${SSH\_COMMAND}
  - `    `SSH\_EXIT\_STATUS="${?}"

  - #Capture any non-zero exit status from the SSH\_COMMAND and report to the user.
  - `    `if [[ "${SSH\_EXIT\_STATUS}" -ne 0 ]]
  - `    `then
  - `      `EXIT\_STATUS=${SSH\_EXIT\_STATUS}
  - `      `echo "Execution on ${SERVER} failed." >&2
  - `    `fi
  - `  `fi
  - done

  - exit ${EXIT\_STATUS}
- Add the servers in /etc/hosts file
  - 10.9.8.11 server01
  - 10.9.8.12 server02
- ping the servers and confirm if its up
  - $ ping -c 1 server01
  - $ ping -c 1 server02
- Configure ssh authentication for both of the servers
  - $ ssh-keygen
  - $ ssh-copy-id server01
  - $ ssh-copy-id server02
- Verify you can execute the commands on the servers
  - $ ssh server01 hostname
  - $ ssh server02 hostname
- Create a list of servers that we have just created
  - $ echo server01 > server
  - $ echo server02 >> server
  - $ cat server
- Save and run
  - $ sudo ./run-everywhere.sh
  - $ ./run-everywhere.sh
  - $ ./run-everywhere.sh -x hostname
  - $ ./run-everywhere.sh hostname
  - $ ./run-everywhere.sh -n hostname
  - $ ./run-everywhere.sh -v uptime
  - $ ./run-everywhere.sh -ns id
  - $ ./run-everywhere.sh -sv id
