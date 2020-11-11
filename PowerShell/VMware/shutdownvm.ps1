# This script can be used to shutdown VMs in an specific vCenter.

Set-PowerCLIConfiguration -InvalidCertificateAction Ignore
Connect-VIServer <serverIP>
Get-Content [<path to file\>]vms_to_remove.txt | foreach {stop-vm $_}

#You can use the -Confirm flag to avoid getting prompt for confirmation.
