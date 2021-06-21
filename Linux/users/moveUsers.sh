#!/bin/bash 
#
# This script:
#  1. Backs up passwd, shadow, group, shgroup
#  2. Prints put the useradd commands to add to the new server, using awk, from old server /etc/passwd
#  3 Check for sudo... PENDING
#

# Backup /etc/ passwd, shadow, groups, groupshadow

printf "\n\t +++ Creating backups of passwd files under /root/ +++\n"
cp /etc/passwd ~/passwd.bak
cp /etc/shadow ~/shadow.bak
cp /etc/group ~/group.bak

#Checking of user groups:
printf "\n\t Checking for groups other than \"users\" group\n"
for user2check in $(awk -F: '$4 == 100 {print $1}' ~/passwd.bak); 
do 
  groups "$user2check"; 
done

# Gets the useradd commands needed to create the new users in the new server, same UID, same GUID
awk -F: '$4 == 100 {print "useradd -u " $3 " -g " $4 " -c \"" $5 "\"" " -d " $6 " -s " $7 " -m " $1}'  ~/passwd.bak

#Run configuration checks: USE IF STATEMENS, Check later... :)
printf "\n\t Running configuration checks: pwconv... \n"
pwconv # Add IF logic to check for errors, if so, roll back to backups...
printf "\n\t Running configuration checks: pwck... \n"
printf "\n\t Running configuration checks: grpck... \n"
