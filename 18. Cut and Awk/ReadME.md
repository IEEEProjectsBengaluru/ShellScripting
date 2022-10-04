**Cut and Awk commands**

In this session we will see how we can use cut and awk commands. The cut command is used for cutting out sections from each line of input it receives. The awk command

searches files for text containing a pattern.

**Cut command**

- Cut is not a shell builtin
  - $ type -a cut
  - $ man cut
- Lets use cut command to try out few examples
  - $ cut -c 1 /etc/passwd
  - $ cut -c 7 /etc/passwd
  - $ cut -c 4-7 /etc/passwd
  - $ cut -c -4 /etc/passwd
  - $ cut -c 1,3,5 /etc/passwd
  - $ echo “hello” | vut -c 1
  - $ echo -e ‘one\ttwo\tthree’ | cut -f 3
  - $ echo ‘one,two,three’ | cut -d ‘,’ -f 1
- Lets print the user name and uid of every user of the password file
  - $ cut -d ‘:’ -f 1,3 /etc/passwd
  - $ cut -d ‘:’ -f 1,3  --output-delimiter=’,’ /etc/passwd

**AWK Command**

- Lets try the same command that we used using cut
  - $ cut -d ‘:’ -f 1,3 /etc/passwd
  - $ awk -F ‘:’ ‘{print $1,  $3}’ /etc/passwd
  - $ awk -F ‘:’ ‘{print $1 $3}’ /etc/passwd
- The comma inside the {} represnts Output Field Seperator (OFS), by default it represents as space between the fields
- awk has special variables OFS, it can be changed to anything required seperator
  - $ awk -F ‘:’  -v OFS=’,’ ‘{print $1 $3}’ /etc/passwd
  - $ awk -F ‘:’  -v ‘{print $1 $3}’ /etc/passwd
  - $ awk -F ‘:’  -v ‘{print ”COL1: “  $1,  “ COL3: “ $3}’ /etc/passwd
- Lets see an irrugular data and see how we can use awk command
  - $ echo ‘L1C1      L1C2’ > lines
  - $ echo ‘       L2C1 L2C2      ’ >>  lines
  - $ echo ‘ L3C1     L3C2’ >>  lines   
  - $ echo -e ‘L4C1\tL4C2’ >> lines
  - $ cat lines
  - $ awk ‘{print $1, $2}’ lines


**Script**

- Lets say that we want a list of port numbers that are opened in our system. The netstat command displays the open ports in a local system.
  - $ netstat -nutl
  - This contains 2 lines headers
  - $ netstat -nutl | grep -v ‘^Active’ | grep -v ‘^Proto’
  - We can also use this command as well
  - $ netstat -nutl | grep -Ev ‘^Active|^Proto’
- We can also diplay the lines which has ‘:’ using grep
  - $ netstat -nutl | grep ‘:’
- Lets use cut to get the port numbers and see the results
  - $ netstat -nutl | grep ‘:’ | cut -d ‘:’ -f 2
  - You will observe there are lot of white spaces
- Will use the awk command now
  - $ netstat -nutl | grep ‘:’ | awk ‘{print $4}’
  - $ netstat -nutl | grep ‘:’ | awk ‘{print $4}’ | awk -F ‘:’ ‘{print $NF}’
- Lets try to elimimnate tcpv6
  - $ netstat -4nutl
  - $ netstat -4nutl | grep ‘:’ | awk ‘{print $4}’ | awk -F ‘:’ ‘{print $NF}’
  - $ netstat -nutl | grep ‘:’ | awk ‘{print $4}’ | cut -d ‘:’ -f 2
- Lets create a new script networkPorts.sh
  - #This script shows the open network ports on a system.
  - #Use -4 as an argument to limit to tcpv4 ports.
  - netstat -nutl ${1} | grep : | awk '{print $4}' | awk -F':' '{print $NF}'
- Save and run
  - $ ./networkPorts -4
  - $ ./networkPorts -p
