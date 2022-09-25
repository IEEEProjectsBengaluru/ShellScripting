**Standard Input, Standard Output and Standard error**

In this session we will understand the stdin,stdout and stderr.

**STDIN and STDOUT**

- There are 3 basic IO stdin,stdout and stderr. By default stdin comes from keyboard and the input need not to come from keyboard we can use | pipe to pass output of one command to input for another. And by default stdout and stderr defaults outputs to screen.
- Lets redirect STDOUT to a file. The > symbol redirects to stdout to a file
  - FILE="/tmp/data"
  - head -n1 /etc/passwd > ${FILE}
- Save and execute
  - $ ./Redirecting.sh
  - $ cat /tmp/data
- > symbol can be used to redirect the stdout to any file. For eg
  - $ echo “hello world”  > new.txt
  - $ cat new.txt
- To read stdin use < symbol. Lets use the same FILE to read a line.
  - # Redirect STDIN to a program.
  - read LINE < ${FILE}
  - echo " LINE variable contains: ${LINE}"
- Lets redirect STDOUT to a file, overwriting the file.
  - head -n3 /etc/passwd > ${FILE}
  - echo
  - echo "Contents of ${FILE}:"
  - cat ${FILE}
- > will overwite the file. If we want to append the content then use >>. For eg
  - $ echo “new” > new.txt
  - $ cat new.txt
  - $ echo “another-line” >> new.txt
  - $ cat new.txt


**STDERR**

- File descriptor -Its a number which represents the opened file. Computer uses this number to represents the file.
- By default every new process starts with 3 open file descriptors, they are
  - FD0 – STDIN
  - FD1 – STDOUT
  - FD2 - STDERR
- Lets use FD for input redirection using an example
  - $ cat /etc/centos-release
  - $ read X < /etc/centos-release
  - $ echo ${x}
  - # This is same as following with FD, note there is no space between 0 and <
  - $ read X 0< /etc/centos-release
  - $ echo ${X}
- Lets use FD for output redirection using an example
  - $ echo “${UID}” > uid
  - $ cat uid
  - # This is same as following with FD
  - $ echo “${UID}”  1> uid
  - $ cat uid
- Lets see an example how error are redirected to the screen,
  - $ head -n1 /etc/passwd /etc*/*hosts /fakefile > head.out
  - You can see that head.out will have the results and error is displayed on the screen.
- Lets see how we can redirect the stderr
  - $ head -n1 /etc/passwd /etc*/*hosts /fakefile 2> head.err
  - This will display the results in screen and redirects the error to the head.err file. See $ cat head.err
- You can even combine redirecting stdout and stderr to serperate files
  - $ head -n1 /etc/passwd /etc*/*hosts /fakefile > head.out 2> head.err
  - No outputs will displayed in the screen.
  - $ rm head.err hear.out
- If you want to redirect both stdout and stderror to a same file, you can do this
  - $ head -n1 /etc/passwd /etc*/*hosts /fakefile > head.both 2>&1
  - # You can also do this for same task
  - $ head -n1 /etc/passwd /etc*/*hosts /fakefile &> head.both
  - # If you want to append the file
  - $ head -n1 /etc/passwd /etc*/*hosts /fakefile &>> head.both
- Note: While using | pipe command the stdout of first command will serve as stdin for the next command. However the stderr will not flow through the pipe.
  - $ head -n1 /etc/passwd /etc*/*hosts /fakefile | cat -n
- To redirect error to input use,
  - $ head -n1 /etc/passwd /etc*/*hosts /fakefile 2>&1 | cat -n
  - # OR
  - $ $ head -n1 /etc/passwd /etc*/*hosts /fakefile |& cat -n
- Lets  add all these concepts to our file
  - # Redirect STDIN to a program, using FD 0.
  - read LINE 0< ${FILE}
  - echo
  - echo "LINE contains: ${LINE}"

  - # Redirect STDOUT to a file using FD 1, overwriting the file.
  - head -n3 /etc/passwd 1> ${FILE}
  - echo
  - echo "Contents of ${FILE}:"
  - cat ${FILE}

  - # Redirect STDERR to a file using FD 2.
  - ERR\_FILE="/tmp/data.err"
  - head -n3 /etc/passwd /fakefile 2> ${ERR\_FILE}
  - echo
  - echo "Contents of ${ERR\_FILE}:"
  - cat ${ERR\_FILE}

  - # Redirect STDOUT and STDERR to a file.
  - head -n3 /etc/passwd /fakefile &> ${FILE}
  - echo
  - echo "Contents of ${FILE}:"
  - cat ${FILE}

  - # Redirect STDOUT and STDERR through a pipe.
  - echo
  - head -n3 /etc/passwd /fakefile |& cat -n

  - # Send output to STDERR
  - echo "This is STDERR!" >&2

  - # Discard STDOUT
  - echo
  - echo "Discarding STDOUT:"
  - head -n3 /etc/passwd /fakefile > /dev/null

  - # Discard STDERR
  - echo
  - echo "Discarding STDERR:"
  - head -n3 /etc/passwd /fakefile 2> /dev/null

  - # Discard STDOUT and STDERR
  - echo
  - echo "Discarding STDOUT and STDERR:"
  - head -n3 /etc/passwd /fakefile &> /dev/null

  - # Clean up
  - rm ${FILE} ${ERR\_FILE} &> /dev/null



