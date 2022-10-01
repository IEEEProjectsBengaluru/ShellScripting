# Deleting and Disabling Linux accounts

In this demo we will see how we can disable, delete and archive users on a Linux systems.


## Finding files

- The command to delete a user from Linux command is userdel.
- $ type -a userdel -> this says userdel is not found
- $ which userdel -> this will tell there is no userdel in PATH
- To find a command which is not in the path then use locate command
  - $ locate userdel
- locate doesnt use real time data, to understadn this lets try an example
  - $ touch userdel
  - $ locate userdel
- From this we can see that userdel which is created just a while ago is not visible in locate command.
- You need to run updatedb to get the updated results
  - $ sudo updatedb
  - $ locate userdel
- **Note**: $ sudo !! - will displays all the recent commands that is executed
- You can also use find command to find any files
  - $ find /usr/bin
  - $ find /usr/sbin -name userdel
  - $ find / -name userdel
  - $ find / -name userdel 2>/dev/null
  - $ sudo find / -name userdel

## Userdel command

- Lets see how we can use userdel command
  - $ man userdel
- Lets see the users on the local system before we delete a user
  - $ tail /etc/passwd
- Delete a user
  - $ sudo userdel <username>
  - $ id <username>
  - $ ls -l /home
- Delete a user and remove the home directory
  - $ sudo userdel -r <username>
  - id -u <username>
  - ls -l /home/<username>


## Archiving files

- To archive files we can use tar command
  - $ type -a tar
  - $ man tar
- Lets see how we can use tar command to archive files.
  - $ mkdir randomVideos
  - $ touch randomVideos/video1.mp4
  - $ touch randomVideos/video2.mp4
  - $ touch randomVideos/video3.mp4
  - $ touch randomVideos/video3.mp4
  - $ ls -l randomVideos/
  - $ tar -cf myarch.tar randomVideos
  - $ ls
- You can compress the archive files to save some space
  - $ gzip myarch.tar
  - $ ls
- To uncompress the tar file
  - $ gunzip myarch.tar.gz
- Compressing can be done in conjunction with tar command
  - $ tar -zcvf myarch.tar.gz randomVideos/
  - $ ls

## Disabling account

- To disable the account we can use chage command
  - $ man chage
  - $ sudo chage -E 0 <username> # to disable this account
  - $ sudo chage -E 1 <username> # to enable the account

## Create a script

- Create a new script delUser.sh
  - #This script deletes a user.
  - #Run as root.
  - if [[ "${UID}" -ne 0 ]]
  - then
  - echo 'Please run with sudo or as root.' >&2
  - exit 1
  - fi
  - #Assume the first argument is the user to delete.
  - USER="${1}"
  - #Delete the user.
  - userdel ${USER}
  - #Make sure the user got deleted.
  - if [[ "${?}" -ne 0 ]]
  - then
  - echo "The account ${USER} was NOT deleted." >&2
  - exit 1
  - fi
  - #Tell the user the account was deleted.
  - echo "The account ${USER} was deleted."
  - exit 0
