#!/bin/bash

# Display the UID and username of the user executing this script.
# Display if the user is the root user or not.


# Display the UID
echo "Your ID is ${UID}"

# UID - speical variable from bash
# To know the user name use $ whoami or $ id -un , see $ man whoami or $ man ip


# Display the username
USER_NAME=$(id -un)

# older style syntax with `
#USER_NAME=`id -un`

echo "Your username is ${USER_NAME}"


# Display if the user is the root user or not
if [[ "${UID}" -eq 0 ]];

# older way
# if [ "${UID}" -eq 0];

then
   echo 'You are root.';

else
    echo 'You are not root.';
fi

# Execute $type -a if - to see if its a shell command then do $ man if - to get help contents

# [[ ..]] - expression

# -eq ->  is equal to 0
# root has always UID 0


