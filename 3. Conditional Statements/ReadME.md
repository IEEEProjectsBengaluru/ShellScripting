**Conditional statements**

In this session we will see how to use conditional statements. In this demo lets see if the user executing this script is a is root user or other user.

**Steps**

- Launch VM and create a new schell script
- First get the UID and display
  - echo “Your UID is ${UID}”
- Here UID is a builtin read-only variable. See $ man bash for more info. To search a string  do “/UID” when you see a manual page. Clink “n” or “Shift+n” to go forward/back for the search results.
- Setting to UID to any value will result in error, for eg: $ UID=”1234”
- Display the user name by calling “id” command
  - $ id -u
  - $ id -u -n
  - $ id -un
- In shell script create a variable for displaying username
  - USER\_NAME=$(id -un)
  - echo “Your username is ${USER\_NAME}”
- You can also use , this is an older syntax
  - USER\_NAME=’id -un’
- Lets write a conditional statment to see if the user is root user or not
  - if [[ “${UID}” -eq 0 ]]
  - then
  - `     `echo ‘You are root’
  - else
  - `     `echo ‘You are not root’
  - fi
- To get a help on if command do
  - $ type -a if
  - $ help if
- You can also use if statement in one line using semicolon
  - if [[ “${UID}” -eq 0 ]];  then  echo ‘You are root’; fi
- [[ is a shell keyword
  - type -a [[
  - help [[
- UID 0 means its a root user on every linux system
- Execute the script without and with root user
  - $ ./<filename>.sh
  - $ sudo ./<filename.sh>
  - $ su # password is vagrant
  - $ ./<filename>.sh
  - $ exit





