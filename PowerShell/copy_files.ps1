#This script copies files to remote servers in batches.

$computer_list = #Here goes the list of computers you want to copy files to, a text file.
$destination = #Here goes the destination path, most likely using C$\SOME_PATH_HERE
$item_to_copy = #here is the item or items to copy


foreach ($computer in (Get-Content $computer_list)) {
	if ((Test-Path -Path \\$computer\$destination)) {
		copy-item -Source $item_to_copy -Destination \\$computer\$destination -verbose
	} else {
		"\\$computer\$destination is not reachable or does not exist"
	}
}
