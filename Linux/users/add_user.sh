#!/bin/bash

#############################
#
# Created by Rodrigo Alfaro on 11/11/2020
#
# FIRST VERSION of script to add users to a CentOS/RHEL server
# it receives 3 parametes, username, user group and email/comment
# The script check if user exists, if not, creates user within the 
# GUID specified by the group ID argument, then adds a temporal (hardcoded, need to improve)
# password, then expires the users password to change in next login.
#
#
#############################

if [ "$#" -ne 3 ]; then
        echo -e "\n*** ERROR: Not enough arguments to continue\n"
        echo -e "USAGE:\n"
        echo -e "\tadd_user.sh <username> <group_id> <email OR comment>\n"
        echo -e "--- EXAMPLE:\n"
        echo -e "\tadd_user.sh jdoe 1234 john.doe@acme.com\n"
        exit 1
fi

user_name=$1
group_id=$2
email=$3
#user_cred='Summer2020!'

# Check if user already exist in /etc/passwd
getent passwd $user_name > /dev/null 2&>1
if [ "$?" -eq 0 ]; then
        echo "User does exist in /etc/passwd... Aborting"
        exit 2
fi

#Adding user with UID in the 1000s
/usr/sbin/useradd -u `cut -d: -f3 /etc/passwd | grep "^1...$" | sort -n | tail -1 | awk '{print $1+1}'` -g $group_id -c "$email" -s /bin/bash -m -k /etc/skel -d /home/$user_name $user_name

# Check if the user was created.
if [ "$?" -eq 0 ]; then
        /usr/bin/echo "$user_name:Summer2020!" | /usr/sbin/chpasswd
                if [ "$?" -eq 0 ]; then
                		echo -e "\nPassword set successfully... Expiring password:\n"
                        passwd -e $user_name                    
                        echo -e "\nPassword Status:\n"
                        passwd -S $user_name
                        echo -e "\n*** User created successfully"
                        exit 0
                else
                        echo "User created successfully"
                        echo "BUT... not able to create password using *chpasswd*"
                        exit 4
                fi
else
        echo "There was an error while creating the user with *useradd* command"
        echo "We already checked if the user existed, but it did not"
        echo "But... review variables and check if user is in /etc/passwd file (not likely)"
        exit 5
fi
