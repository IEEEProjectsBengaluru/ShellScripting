# Hello world Shell Script

## Initial configuration steps

- Open command window/terminal
- Change to your prefered directory where you would keep all files
- Create a directory
  - $ mkdir localusers
  - $ cd localusers
- Create a vagrant configuration file by executing following command
  - $ vagrant init jasonc/centos7
- Set the name of VM to localHost and set the IP address
  - Open the configuration file “Vagrantfile” and add following lines
    - confix.vm.box = “jasonc/centos7”
    - config.vm.hostname = “localHost”
    - config.vm.network "private\_network", ip:"10.9.8.7"
- Save the configuration file and reload the VM
  - $ vagrant reload
- Connect to the VM using secure shell  
  - $ vagrant ssh

## Understanding the folder structure in VM and local PC

- After connecting to the VM via SSH , execute following command
  - $ cd /vagrant
  - $ ls -la
- Now you will see that configuration file Vagrantfile is present in this directory.
- You will also see the read-write-execute status (file permissions) for owner, group and others(everybody else)
- Observe that this is the same directory on your local PC where you have done vagrant init command. (This folder is mounted in VM)

## Creating a shell file in Linux

- Execute following command to create a file in Linux (you can use any editor that is available in the Linux OS, I have used nano editor here)
  - $ nano myfile.sh
- This will open a file in the editor.
- Add following lines in this file
  - #!/bin/bash
- Adding this line indicates the commands in this script will be interpreted by /*bin/*bash interpreter.
- Save the file and exit the editor. ctrl+s and ctrl+x.
- You can verify the file by doing $ ls -la command, this will list the file which you have just created
- To see the contents of this file you can do
  - $ cat myfile.sh


## Hello world shell script

- Create a new shell script HelloWorld.sh
  - $ nano HelloWorld.sh
- Use echo command to display “Hello World”
- Save the file and exit
- Change the file permission to make it executable
  - $ chmod +x HelloWorld.sh # or use 777 or 755
- Execute this script on the terminal
  - $ ./HelloWorld.sh
  - ‘./’ - ‘.’ represents this directory and ‘/’ represents directory seperator


## Understanding the file permissions

- Say that you dont have the file permissions to execute a file, this is how you will run into the issues
- Create a blank/empty file
  - $ touch random.sh
  - touch – will create a empty file or if file exists it will update the timestamps of the file
- Verify the status of this file using ls command
- Now try to execute this file
  - $ ./random.sh
  - You will see permission denied issue when you execute this command

## Understanding builtin commands

- echo command is a shell builtin. To know if a command is shell built-in execute ‘type’ command
  - $ type echo
- To see all instances for echo command then do (recommended to use shell builtins for executing the commands)
  - $ type -a echo
- You can even force the echo to use other interpreter
  - $ *usr*bin/echo ‘Hello’
- To get help on shell builtin use help command
  - $ help echo
  - $ help echo |less
- Example of a command which is not shell builtin, eg: uptime
  - $ uptime
  - $ type -a uptime
  - $ help uptime
- To get help for non shell builtin commands use ‘man’ (manual pages) command
  - $ man uptime
