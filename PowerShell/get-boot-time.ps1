
<#  
Created by rodrigo.alfaro@dxc.com on 07/18/2018
Modified on 02/11/2020

Description:
This script gets the uptime for the servers listed in C:\Admin\serverlist.txt 
#>

#Email Recipients for notification.
$to = "rodrigo.alfaro@dxc.com,gaurav.srivastava"
$from = "no_reply@dxc.com"
$subject = "Boot time for Servers"
$smtp_server = "smtp.svcs.entsvcs.com"

$OutputEncoding = [Console]::OutputEncoding 		#Setting encoding to UTF8

#Delete log file if exists, continue if error.
Remove-Item C:\Admin\boottime_log.txt -ErrorAction SilentlyContinue	

$current_date = (Get-Date).ToString()

#Setting file headers
Write-Output "--- MTV Servers Boot time Log ---" | out-file C:/Admin/boottime_log.txt -Encoding utf8
Write-Output ("- Date: " + $current_date + "`n") | out-file -Append C:/Admin/boottime_log.txt -Encoding utf8
Write-Output "Server Name			Boot Time`n------------		-------------------" | out-file -Append C:/Admin/boottime_log.txt -Encoding utf8

#Getting uptime from servers in serverlist.txt
foreach ($i in (Get-Content -Path "C:\Admin\serverlist.txt"))
{
	$time1 = (Get-WmiObject win32_operatingsystem -ComputerName $i) 
	Write-Output ($i + "		" + $time1.ConvertToDateTime($time1.lastbootuptime)) | out-file -Append C:/Admin/boottime_log.txt -Encoding utf8
}

$body = get-content C:\Admin\boottime_log.txt | out-string

#Send email with Blat.exe
#.\blat C:\Admin\boottime_log.txt -t $to -f $from -s $subject -attacht ./boottime_log.txt


#Replacing blat with PowerShell call to Send-MailMessage
Send-MailMessage -Subject $subject -To $to -From $from -Body $body -SmtpServer $smtp_server