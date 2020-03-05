#!/bin/bash
for user in $(cat /<user_list>)
do
        find / -user $user -printf "%u:%p\n" >> /report_file.txt
done
