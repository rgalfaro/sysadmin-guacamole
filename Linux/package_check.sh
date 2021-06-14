#!/bin/bash
#######################################################################################################################
#
# Author: Rodrigo Alfaro, while on DXC eLabs - rodrigo.alfaro@dxc.com / rgalfaro182@gmail.com
#
# Description: This scripts checks if a pacakge, in this case kernel-devel, is installed in the server. 
#
# Reason: Carbon Black software from VMware requies kernel-devel to be installed when in RHEL 8.X or SLES12/15. Also to
# practice bash scripting.
#
# Usage: Not really usefill to run in single servers, but in HPSA to be ran in several servers. If the OS is known, it
# is really kind of usefull really, as you can just send out the command... 
#
#######################################################################################################################

# Creating funcition get_kd
get_kd() { 
if lsb_release -d 2> /dev/null | grep -q SUSE; then # Checks if OS is SUSE
	
  echo " -->>> OS is SuSE Linux in `hostname`"
  # Uses zypper to check for package kernel-devel and prints message if package is installed or not
  zypper info kernel-devel 2> /dev/null | grep -e Name -e Installed -e Status && echo "kenel-devel INSTALLED" || echo " --XXX kernel devel is NOT INSTALLED"
  return 0

elif lsb_release -d 2> /dev/null | grep -iq "Red Hat"; then # If OS is NOT SUSE, checks if RHEL
  
  echo " -->>> OS is Red Hat Entreprise Linux in `hostname`"
  # Uses rpm to check for package kernel-devel and prints message if package is installed or not
  rpm -qa | grep -iq kernel-devel && echo "kenel-devel INSTALLED" || echo " --XXX kernel devel is NOT INSTALLED"
  return 0
  
else # if not SUSE nor RHEL, exit with message and return 1 
  
  echo " XXX -->> OS is NEITHER RHEL nor SUSE in `hostname`"
  return 1

fi
}

get_kd
