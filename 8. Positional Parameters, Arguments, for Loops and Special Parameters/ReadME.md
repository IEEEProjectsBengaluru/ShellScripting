# Positional Parameters, Arguments, for Loops and Special Parameters

Lets display random password for multiple users using positional parameters, arguments and for loops.


## Understanding the command serarch path or PATH env variable

- PATH variable – Anything that is executed in the command window will look for file or a function present in the PATH. The order of checking for the entered command will be from left to right of the PATH variable
  - See help from $ man bash – look for /PATH
  - Execute $ echo PATH – you will see list of file path locations. Any command that is executed in the command window will start looking for its definition from left to right of PATH values.
  - For eg execute $ which -a head – you will see aht head is defined in /usr/bin/head. This is the second file path from PATH variable. Now create another file with name head in /usr/local/bin/ and call $ which -a head you will see that head from /usr/local/bin is at the top of the list.
  - To remove head from /usr/local/bin execute $ sudo rm -rf /usr/local/bin/head
  - We need to clear the hash for bash to remove the head from remembered location. Execute $ hash -r . Because bash remembers the full path names of the executables. To know more see $ help hash.


## Positional Parameter

- To know what user typed on the command line you can use '${0}' where it indicates the 0th argument passed to a script which is the name of the script itself. And '${1}' indicates the first argument that is passed to this script and '${2}' inidcates the second arguments and goes on.
- ${X} – is called positional paramters of the command line.
- Create a new shell script RandomPasswordMultipleUsers.sh to display what user typed on the command line
  - echo “You executed this command: ${0}”
- Lets execute this script to see the what user has typed
  - $ ./RandomPasswordMultipleUsers.sh
  - $ /vagrant/RandomPasswordMultipleUsers.sh
  - Observe the results
- There are 2 commands basename and dirname to get the file path parts information.
  - basename - $ man basename
    - Returns the file name without its folder path
  - dirname - $ man dirname
    - Return directory name of the file
  - basename and dirname doesnt check the file existence it just splits the string and returns the required value. Eg: $ basename /not/here/
- Lets use basename and dirname in our script
  - #Display the path and filename of the script.
  - echo "You used $(dirname ${0}) as the path to the $(basename ${0}) script."
  - Save and execute the script. $ ./RandomPasswordMultipleUsers.sh and $ /vagrant/ RandomPasswordMultipleUsers.sh

## Parameters

- Look for special paramters in $ man bash -> /Special Parameters and go through # sign
- Now lets inform the users about how many arguments they passed in. In the shell script add,
  - #Tell the users that how manu arguments they passed in.
  - #(Inside the script they are parameters, outside they are arguments.)
  - NUMBER\_OF\_PARAMETERS="${#}"
  - echo "You supplied ${NUMBER\_OF\_PARAMETERS} argument(s) on the command line."
- Save and execute the script
  - $./RandomPasswordMultipleUsers.sh
  - $ ./RandomPasswordMultipleUsers.sh one two three
- Lets add a conditional statement to see there is atleast one input argument
  - #Make sure they at least supply one argument
  - if [[ "${NUMBER\_OF\_PARAMETERS}" -lt 1 ]]
  - then
  -  echo "Usage: ${0} USER\_NAME [USER\_NAME] ..."
  -  exit 1
  - fi
- Save and execute the script
  - $./RandomPasswordMultipleUsers.sh
  - $ ./RandomPasswordMultipleUsers.sh one two three
  - $ ./RandomPasswordMultipleUsers.sh “one” “two three” four


## For loops and Special Parameter

- For loop is a shell builtin. To confirm execute $ type -a for and $ help for | head
- Lets try to create a simple for loop in command window
  - $ for X in Frank Claire Doug; do echo “Hi ${X}.”; done
- Look for special paramters in $ man bash -> /Special Parameters and go through @ sign
- Now lets use for loop and @ to display raandom password for no. of the users arguments passed in.
  - #Generate and display a password for each parameter.
  - for USER\_NAME in "${@}"  # $@ will split the input arguments to $1 $2 $3 ...
  - do
  -   PASSWORD=$(date +%s%N | sha256sum | head -c48)
  -   echo "${USER\_NAME}: ${PASSWORD}"
  - done
- Save and execute the script
  - $ ./RandomPasswordMultipleUsers.sh Jack Gary Tom
