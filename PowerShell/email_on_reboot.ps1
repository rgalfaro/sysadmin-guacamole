# This script sends an email after the hosts reboots.
# It is supposed to be set in an scheduled task, trigered after the system starts.
# Rodrigo Alfaro - 02/11/2020

$host_name = $env:COMPUTERNAME
$e_recipient
$e_from
$e_subject = "Computer $host_name has rebooted at $(Get-Date)"
$e_body= "$e_subject, if this was an unxpected reboot, please login into the server at $host_name.lab.ab.elabs.svcs.entsvcs.net and check for issues."
$e_smtp_server = ""

Send-MailMessage -to $e_recipient -Subject $e_subject -Body $e_body -From $e_from -SmtpServer $e_smtp_server