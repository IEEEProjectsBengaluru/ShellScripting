# Random Data, Cryptographic hash functions and string manipulation

Lets generate a random passwords for the users


## Generate Random numbers – using builtin variables

- Create a new shell script
- There is an shell builtin variable called RANDOM, we can confirm that $ man bash
- Lets use the builtin variable to generate random numbers
  - PASSWORD="${RANDOM}"
  - echo "${PASSWORD}"
- To genererate three random numbers together
  - PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
  - echo "${PASSWORD}"

## Generate Random numbers – using date and time builtin variables

- To generate random data we can also use the current data/time as the basis for the password, as time is always changing
  - PASSWORD=$(date +%s)
  - echo "${PASSWORD}"
- %s – seconds elapsed since 1970-01-01 , this is called posix time/epic time, unix time
- Using nano seconds will add more complexity in the password to hack. And to use nano seconds to act as randomisation
  - PASSWORD=$(date +%s%N)
  - echo "${PASSWORD}"
  
  ## Generate Random numbers – using cryptographic hash functions (checksum)

- A better password will be using checksum sha256sum builtin (cryptographic hash functions)
  - PASSWORD=$(date +%s%N | sha256sum | head -c32)
  - echo "${PASSWORD}"
- head -c32 = will print first 32 bytes. See $ man head for more info
- To get the checksum for any file execute
  - $ sha1sum <filename>
  - $ sha256sum <filename>
  - Lets add a new character to a file and check the checksum
  - $ echo “1” >> <filename>
- To know all checksum commands available execute
  - $ ls -la *usr*bin/\*sum
- An even better password can be obtained by adding random numbers with checksum
  - PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c48)
  - echo "${PASSWORD}"

## Add special characters to the password

- Append a special character to the password.
  - SPECIAL\_CHARACTER=$(echo '!@#$%^&\*()\_+-=' | fold -w1 | shuf | head -c1)
  - echo "${PASSWORD}${SPECIAL\_CHARACTER}"
- shuf – generates random perumations
  - $ shuf /etc/passwd # shuffles the lines randomly
- fold – wraps each input line to fit in specified width
  - $ echo “qwertyuiopads” | fold -w1
