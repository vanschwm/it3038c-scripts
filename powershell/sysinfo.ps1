function getIP { 
(Get-NetIPAddress).IPv4Address | select-string "192*" 
}

### I was removing all the commands I was typing and starting fresh on each one. I have a word document with everything I learned throughout the lab if you would like me to send it to you. 