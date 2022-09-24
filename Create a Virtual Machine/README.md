**Add an operating system image in Vagrant**

- Open command prompt/terminal window from your PC
- Execute following command to download the operating system. You only need to download the operating system oncce as this image will be cloned when you create a new VM with this name.
  - $ vagrant box add <USER/BOX>
  - eg:- $ vagrant box add debian/jessie64
- After executing this command you will see something like this , indicating an operating system is downloaded in your system
-  <img src= https://github.com/IEEEProjectsBengaluru/ShellScripting/blob/main/Create%20a%20Virtual%20Machine/Screenshot%20from%202022-08-28%2017-03-30.png>
- Create a directory for maintaining all files in one folder
  - $ mkdir myShellClass
  - $ cd myShellClass

**Create a Vagrant project folder**

- Create a folder before creating an Vagrant project
  - $ mkdir testbox01
  - $ cd testbox01
- Create a Vagrant configuration file by executing following command. This command will create a configuration file in the project folder
  - $ vagrant init debian/jessie64
  - <img src= https://github.com/IEEEProjectsBengaluru/ShellScripting/blob/main/Create%20a%20Virtual%20Machine/Screenshot%20from%202022-08-28%2017-26-42.png>

**Launch Virtual Machine**

- Execute the following command to launch the VM. By default the VM will start in headless mode without any UI.
  - $ vagrant up
- Confirm VM is running by launching VirtualBox
- <img src= https://github.com/IEEEProjectsBengaluru/ShellScripting/blob/main/Create%20a%20Virtual%20Machine/Screenshot%20from%202022-08-28%2017-44-20.png>
- You can also use the following command to see the status
  - $ vagrant status


**Connect to the VM using secure shell**

- Execute following command to connect to VM.
  - $ vagrant ssh
- Now you will be connected to VM with vagrant user. (default password: “vagrant”)
- To log out the VM execute
  - $ exit


**Stop the VM**

- To stop the VM execute following command, this command shuts down the VM.
  - $ vagrant halt


**Additional Info**

- To set the name of VM, follow these steps
  - Open the configuration file “Vagrantfile” and add following line right after the box name
    - confix.vm.box = “jasonc/centos7”
    - config.vm.hostname = “testbox01”
  - To see this change execute
    - $ vagrant reload
    - vagrant ssh
  - Now you will see the host name is reflected
- To set the IP address for your VM
  - Add following line in Vagrantfile configuration file
    - confix.vm.box = “jasonc/centos7”
    - config.vm.hostname = “testbox01”
    - config.vm.network "private\_network", ip:"10.9.8.7"
  - Save the configuration file
  - Reload the VM
    - $ vagrant reload
  - Test the network connectivity of the VM by calling ping command
    - $ ping 10.9.8.7
- To delete a Vagrant project, execute
  - $ vagrant destroy
