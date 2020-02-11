# This script sends an email after the hosts reboots.
# It is supposed to be set in an scheduled task, trigered after the system starts.
# Rodrigo Alfaro - 02/11/2020

$host_name = $env:COMPUTERNAME
$recipient = "rodrigo.alfaro@dxc.com", "prasad.r@dxc.com", "gaurav.srivastava@dxc.com", "soumitra.padhi@dxc.com"
$from = "no_reply@dxc.com"
$subject = "Computer $host_name has rebooted at $(Get-Date)"
$body= "$subject, if this was an unxpected reboot, please login into the server at $host_name.lab.ab.elabs.svcs.entsvcs.net and check for issues."
$smtp_server = "smtp.svcs.entsvcs.com"

Send-MailMessage -to $recipient -Subject $subject -Body $body -From $from -SmtpServer $smtp_server