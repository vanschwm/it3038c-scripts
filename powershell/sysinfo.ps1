get-service | format-list displayname, status
get-service | format-table displayname, status
get-service | format-table *
get-service | sort-object -Property status -Descending | Format-Table displayname, status
get-service | sort-object -Property status -Descending | Format-Table displayname, status | out-file c:\services.txt
get-service | out-gridview
get-service | select-object displayname, status | out-gridview
get-service | select-object * | out-gridview

$Hello = "hello, Powershell!"
write-host($hello)

Set-ExecutionPolicy -ExecutionPolicy Unrestricted

Get-NetIPAddress
Get-Help Get-NetIPAddress

get-command Get-NetIPAddress

(Get-NetIPAddress).ipv4address

(Get-NetIPAddress).IPv4Address | select-string "192*"

function getIP {
(Get-NetIPAddress).IPv4Address | select-string "192*"
}
write-host(getIP)

$IP = getIP
write-host("This machines IP address is $IP")


