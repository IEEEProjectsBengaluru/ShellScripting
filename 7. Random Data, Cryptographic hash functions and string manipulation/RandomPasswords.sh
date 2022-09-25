#!/bin/bash

# This script generates a list of random passwords.
# echo "${RANDOM}" -> RANDOM is the buitin variable

PASSWORD="${RANDOM}"
echo "${PASSWORD}"

# Three random numbers together
PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
echo "${PASSWORD}"

# Use the current data/time as the basis for the password.
PASSWORD=$(date +%s)
echo "${PASSWORD}"

# Use nano seconds to act as randomisation
PASSWORD=$(date +%s%N)
echo "${PASSWORD}"

# A better password. using checksum sha256sum builtin
PASSWORD=$(date +%s%N | sha256sum | head -c32)
echo "${PASSWORD}"

# An even better password. by adding random numbers.
PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c48)
echo "${PASSWORD}"

# Append a special character to the password.
SPECIAL_CHARACTER=$(echo '!@#$%^&*()_+-=' | fold -w1 | shuf | head -c1)
echo "${PASSWORD}${SPECIAL_CHARACTER}"
