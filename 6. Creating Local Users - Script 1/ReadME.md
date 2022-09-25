**Add local users to the system**

The goal of this exercise is to create a shell script that adds users to the same Linux system as the script is executed on. And you will be prompted to enter the username, the person name, and a password.

**Steps**

- Create a new shell script
- Make sure the script is being executed with superuser privileges.
  - if [[ "${UID}" -ne 0 ]]
  - then
  - `	`echo 'Pleae run with sudo or as root.'
  - `	`exit 1
  - fi
- Now get the username(login).
  - read -p 'Enter the username to create: ' USER\_NAME
- Get the real name(contents for the description field).
  - read -p 'Enter the name of the person or application that will be using this account: ' COMMENT
- Get the password
  - read -p 'Enter the password to use for the account: ' PASSWORD
- Create the account.
  - useradd -c "${COMMENT}" -m ${USER\_NAME}
- Check to see if the useradd command succeeded and we dont want to tell the user that an account was created when it hasn't been.
  - if [[ "${?}" -ne 0 ]]
  - then
  - `	`echo 'The account couldnt be created'
  - `	`exit 1
  - fi
- Set the password
  - echo ${PASSWORD} | passwd --stdin ${USER\_NAME}
  - if [[ "${?}" -ne 0 ]]
  - then
  - `	`echo 'The password for the account couldnt be set.'
  - `	`exit 1
  - fi
- Force password change on first login.
  - passwd -e ${USER\_NAME}
- Display the username, password, and the host where the user was created.
  - echo
  - echo 'username:'
  - echo "${USER\_NAME}"
  - echo
  - echo 'password:'
  - echo "${PASSWORD}"
  - echo
  - echo 'host name:'
  - echo "${HOST\_NAME}"
