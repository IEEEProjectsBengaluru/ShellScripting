## Create multiple VMs

- Create a new folder on your PC
  - $ mkdir multitest
  - $ cd multitest
- Create a Vagrant configuration file by executing following command.
  - $ vagrant init jasonc/centos7
- Open the Vagrantfile with text editor and add the following lines
- <img src= https://github.com/IEEEProjectsBengaluru/ShellScripting/blob/main/Create%20multiple%20VMs/Screenshot%20from%202022-08-29%2020-47-32.png>
- Save the file
- Now launch the VM
  - $ vagrant up # If you want to  all the VMs
  - $ vagrant up dummyHost # To launch particular VM
- Check the status
  - $ vagrant status
- Connect to first VM
  - $ vagrant ssh dummyHost
  - $ exit
- Connect to second VM
  - $ vagrant ssh testHost
  - $ ping -c 3 10.9.8.6
  - $ exit
- To shut down the VMs
  - $ vagrant halt

