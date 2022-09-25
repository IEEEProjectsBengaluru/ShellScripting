**Reading Standard inputs, creating accounts, username conventions**

Lets create a script which creates an account on the local system by asking username and account


**Reading Standard inputs**

- Lets ask the username
  - read -p 'Enter the username to create: ' USER\_NAME
- “read” command will read the input from the user. Standard input – from keyboard.
  - $ type -a read
  - $ help read | less
- USER\_NAME – will be a variable to store the input. Generally user names will be of 8 characters with all smaller case. (No hard rule, just the convention used for creating user names)
- Now ask for the real name.
  - read -p 'Enter the name of the person who this account is for: ' COMMENT
- Lets ask for the password.
  - read -p 'Enter the password to use for the account: ' PASSWORD

**Create an user account**

- To create a user
  - useradd -c "${COMMENT}" -m ${USER\_NAME}
- Added “” for COMMENT because it may contain space, to parse that “” is needed.
- See $ man useradd for help text
- To set the password for the user type,
  - echo ${PASSWORD} | passwd --stdin ${USER\_NAME}
- --stdin – this will read the password from the standard input  and with pipe it will read it from the previous command which is echo command here.
- Force password change on first login.
  - passwd -e ${USER\_NAME}
- Execute the script and login as new user
  - $ ./<filename>.sh
  - $ su - <username>
