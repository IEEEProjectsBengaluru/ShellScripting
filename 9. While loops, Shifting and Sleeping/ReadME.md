**While loops, infinite loops, Shifting and Sleeping**

In this session lets try to understand the shift and while loops through an example.


**Loops, Sleep and Shift**

- Lets create a script to display first three arguments
  - # Dispay the first three parameters.
  - echo " Parameter 1: ${1}"
  - echo " Parameter 2: ${2}"
  - echo " Parameter 3: ${3}"
  - echo
- Save and execute
  - $ ./WhileLoops.sh
  - $./WhileLoops .sh apple
  - $./WhileLoops.sh apple orange
- Lets look into while command. $ type -a while $ help while
- Lets create a while loop in command line
  - $ X = 1
  - $ while [[ “${X}” -eq 1]]; do   echo “This is the value of X: ${X}”; X = 7; done
- There is a builtin command true which is used in loops, we can get help of this command $ type -a true $ help true $ man true
  - $ true
  - $ echo ${?}
- Before we start further with loops lets take a look at sleep command. $ type -a sleep $ man sleep.
  - $ sleep 1
  - $ sleep 1s
- Lets try to build infinite loop
  - $ while [[ true ]] ; do echo “${Random}; sleep 1; done
  - To exit use ctrl+c
- Lets read  about shift command which helps in shifting positional parameters. $ type -a shift $ help shift
- Lets modify our script WhileLoops .sh to loop over all the positional arguments and shift by one position.
  - # loop through all the positional parameters.
  - while [[ "${#}" -gt 0 ]]
  - do
  - ` `echo "Number of parameters: ${#}"
  - ` `echo " Parameter 1: ${1}"
  - ` `echo " Parameter 2: ${2}"
  - ` `echo " Parameter 3: ${3}"
  - ` `echo
  - ` `shift
  - sleep 1
  - done
- Save and execute
  - $ ./WhileLoops.sh
  - $./WhileLoops.sh apple  orange grape banana melon cherry
