**Creating Local Users - Script 2**

The goal of this exercise is to create a shell script that adds users to the same Linux system as the script is executed on.


**Steps**

- This script creates a new user on the local system. You must supply a username as an argument to the script. Optionally, you can also provide a comment for the account as an argument. A password will be automatically generated for the account.The username, password, and host for the account will be displayed.
- ` `Make sure the script is being executed with superuser privileges.
  - if [[ "${UID}" -ne 0 ]]
  - then
  - `   `echo 'Please run with sudo or as root.' >&2
  - `   `exit 1
  - fi
- If the user doesn't supply at least one argument, then give them help.
  - if [[ "${#}" -lt 1 ]]
  - then
  - `  `echo "Usage: ${0} USER\_NAME [COMMENT]..." >&2
  - `  `echo 'Create an account on the local system with the name of USER\_NAME and a comments field of COMMENT.' >&2
  - `  `exit 1
  - fi
- The first parameter is the user name
  - USER\_NAME="${1}"
- The rest of the parameters are for the account comments.
  - shift
  - COMMENT="${@}"
- Generate a password.
  - PASSWORD=$(date +%s%N | sha256sum | head -c48)
- Create the user with the password.
  - useradd -c "${COMMENT}" -m ${USER\_NAME} &> /dev/null
- Check to see if the useradd command succeeded.We don't want to tell the user that an account was created when it hasn't been.
  - if [[ "${?}" -ne 0 ]]
  - then
  - `  `echo 'The account could not be created.' >&2
  - `  `exit 1
  - fi
- Set the password.
  - echo ${PASSWORD} | passwd --stdin ${USER\_NAME} &> /dev/null
- Check to see if the passwd command succeeded.
  - if [[ "${?}" -ne 0 ]]
  - then
  - `  `echo 'The password for the account could not be set.' >&2
  - `  `exit 1
  - fi
- Force password change on first login.
  - passwd -e ${USER\_NAME} &> /dev/null
- Display the username, password, and the host where the user was created.
  - echo 'username:'
  - echo "${USER\_NAME}"
  - echo
  - echo 'password:'
  - echo "${PASSWORD}"
  - echo
  - echo 'host:'
  - echo "${HOSTNAME}"
  - exit 0
