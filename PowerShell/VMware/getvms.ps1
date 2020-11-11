# From a list of files that contain the VM names
# you can get the listiong of the VMs in vCenter
#
# First, you need to connect to the vCenter you want to search in:

Connect-VIServer -Name <IP or FQDN for vCenter>

#If you get an error for Invalid Certificate Action, you need to set the powershell setting for ingnoring certifcates:
# Set-PowerCLIConfiguration -InvalidCertificateAction Ignore
# Then, try to connect again.

#To get the list of vms from a file, createa  file, lets say vm_list.txt with the VM name you want to query

Get-Content [<Path to file\>]vm_list.txt | foreach-object {get-vm $_}

# If you just run get-vm without no paramaters, the command will querry all VMs from the vCenter
# You can filter with findstr command too, but it will take longer.

#To get templates, use the Template noun for the get verb:

Get-Content [<Path to file\>]vm_template_list.txt | foreach-object {get-template $_}

# One usefull way to get it to work is getting all templates and using findstr for a ticket/SR number:

Get-Template | findstr *<SR/Ticket number>
