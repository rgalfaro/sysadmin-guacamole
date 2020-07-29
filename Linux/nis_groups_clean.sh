#!/bin/bash
#NEEDS TO BE IMPROVED WITH ARGUMENTS, VARIABLES, PROMPTS, ETC
#This script gets a list of users from script argument then remove each user on a NIS group list, named group_list

user_list=$1

#In between commas
for user in $(cat $user_list); do sed -i "s/,$user,/,/" group_list; done
#Last user in group
for user in $(cat $user_list); do sed -i "s/,$user\$//" group_list; done
#Only one user in group
for user in $(cat $user_list); do sed -i "s/:$user\$/:/" group_list; done
#Fist User in group
for user in $(cat $user_list); do sed -i "s/:$user,/:/" group_list; done
