#For more portable scripts, instead of shebang #!/bin/bash, use:
  #!/usr/bin/env bash
  
#Remeber to set the right permissions for comman excetution
  
#On bash scrips, as a best practice, always use double-quotes when calling varibles:
  var="hello"
  echo "variable is: "$var""
  
#To exapnd aliases use CTRL+ALT+E
 
#To bypass aliases, use / in any part of the command
  ls/
  l/s

#To list open files, even device files like ports, interfaces, etc:
  lsof 
 
#To pass arguments to a script:
  #!/bin/bash
  deploy=false
  uglify=false
  # $# is the number of arguments passed to the command.
  while (( $# > 1 )); do case $1 in
  --deploy) deploy="$2";;
  --uglify) uglify="$2";;
  *) break; # Default
  esac; shift 2 # Shifts to get the next variables.
  done
  $deploy && echo "will deploy... deploy = $deploy"
  $uglify && echo "will uglify... uglify = $uglify"
  # how to run
  # chmod +x script.sh
  # ./script.sh --deploy true --uglify false

# Array in Perl
my @array = (1, 2, 3, 4);
# Array in Bash
array=(1 2 3 4)


${array[$i]:N:M} gives out a string from the Nth position (starting from 0) in the string ${array[$i]} with M
following chars.


Print element at index 0
echo "${array[0]}"
Version < 4.3
Print last element using substring expansion syntax
echo "${arr[@]: -1 }"
Version ≥ 4.3
Print last element using subscript syntax
echo "${array[-1]}"
Print all elements, each quoted separately
echo "${array[@]}"
Print all elements as a single quoted string
echo "${array[*]}"
Print all elements from index 1, each quoted separately
echo "${array[@]:1}"
Print 3 elements from index 1, each quoted separately
echo "${array[@]:1:3}"
String


${#array[@]} gives the length of the array ${array[@]}:
