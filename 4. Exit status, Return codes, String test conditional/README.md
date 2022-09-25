# Exit status, Return codes, String test conditional

Lets understand these things through an example. Lets create a script to display if the user is the vagrant user or not

## Steps

- Create a new shell script
- Display the UID
  - echo “Your UID is ${UID}”
- Lets display if the UID doesnt match 1000.
  - UID\_TO\_TEST\_FOR=’1000’
- Lets test the UID using if statement
  - if [[ "${UID}" -ne "${UID\_TO\_TEST\_FOR}" ]]
  - then
  -   echo "Your UID doesnt match ${UID\_TO\_TEST\_FOR}."
  -   exit 1
  - fi
- Use “exit” command to stop executing  script further. By convention 0 – successfull execution and non Zero indicates unsuccessful execution. To know more about ‘exit’ command try $ help exit
- -ne – not equal. To know more see $ help test
- Execute the script with and without vagrant user
  - ./<filename>.sh
  - sudo ./<filename>.sh
- Display the username
  - USER\_NAME=$(id -un)
- Test if the command succeeded
  - if [[ "${?}" -ne 0 ]]
  - # ${?} - is the special variable which holds the exist status of most recent command
  - then
  -  echo 'The id command didn not execute successsfully.'
  -  exit 1
  - fi
  - echo "Your username is ${USER\_NAME}"
- Now lets use string to test the condition
  - USER\_NAME\_TO\_TEST\_FOR='vagrant'
  - if [[ "${USER\_NAME}" = "${USER\_NAME\_TO\_TEST\_FOR}" ]]
  - then
  -  echo "Your username matches ${USER\_NAME\_TO\_TEST\_FOR}."
  - fi

- Note:  '=' is string compare match and  '==' is string pattern match
- Note: “=” will be a test operator when its inside [[]] and “=” will be assignment while declaring a variable
- Now lets try for  != (not equal) for a string
  - if [[ "${USER\_NAME}" != "${USER\_NAME\_TO\_TEST\_FOR}" ]]
  - then
  -   echo "Your username doesnt match ${USER\_NAME\_TO\_TEST\_FOR}."
  -   exit 1
  - fi
- Add exit 0 at the end of the script
  - exit 0
