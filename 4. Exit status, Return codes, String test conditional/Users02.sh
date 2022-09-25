#!/bin/bash

# Display the UID and username of the user executing this script.
# Display if the user is the vagrant user or not.

# Display the UID.
echo "Your UID is ${UID}";

# Only display if the UID doesn NOT match 1000.
UID_TO_TEST_FOR='1000'

if [[ "${UID}" -ne "${UID_TO_TEST_FOR}" ]]
then
    echo "Your UID doesnt match ${UID_TO_TEST_FOR}."
    exit 1
fi


# Display the username
USER_NAME=$(id -un)


# Test if the command succeeded
if [[ "${?}" -ne 0 ]] 
# ${?} - is the special variable which holds the exist status of most recent command
then
    echo 'The id command didn not execute successsfully.'
   exit 1
fi
echo "Your username is ${USER_NAME}" 


# You can use a string test conditional.
USER_NAME_TO_TEST_FOR='vagrant'
if [[ "${USER_NAME}" = "${USER_NAME_TO_TEST_FOR}" ]]
then
   echo "Your username matches ${USER_NAME_TO_TEST_FOR}."
fi

# '=' is string compare match
# '==' is string pattern match


# Test for != (not equal) for string
if [[ "${USER_NAME}" != "${USER_NAME_TO_TEST_FOR}" ]]
then
    echo "Your username doesnt match ${USER_NAME_TO_TEST_FOR}."
    exit 1
fi

exit 0
