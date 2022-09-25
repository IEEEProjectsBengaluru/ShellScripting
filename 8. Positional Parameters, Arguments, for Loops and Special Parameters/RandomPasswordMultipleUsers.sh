#!/bin/bash

# This script generates a random password for each user specified on the command line.

# Display what the user typed on the command line.
echo "You executed this command: ${0}"

# ${0} indicates the name of the this script itself
# ${1} indicates the first argument that is passed to this script
# ${2} inidcates the second arguments and goes on

# Display the path and filename of the script.
echo "You used $(dirname ${0}) as the path to the $(basename ${0}) script."

# Tell the users that how manu arguments they passed in.
# (Inside the script they are parameters, outside they are arguments.)
NUMBER_OF_PARAMETERS="${#}"
echo "You supplied ${NUMBER_OF_PARAMETERS} argument(s) on the command line."

# Make sure they at least supply one argument
if [[ "${NUMBER_OF_PARAMETERS}" -lt 1 ]]
then
   echo "Usage: ${0} USER_NAME [USER_NAME] ..."
   exit 1
fi


# Generate and display a password for each parameter.
for USER_NAME in "${@}"  # $@ will split the input arguments to $1 $2 $3 ...
do
 PASSWORD=$(date +%s%N | sha256sum | head -c48)
 echo "${USER_NAME}: ${PASSWORD}"
done
