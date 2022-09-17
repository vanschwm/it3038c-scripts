$Body = ("This machines IP adress is $IP. The user is $USER. The hostname is $NAME. Powershell version $VERSION. Todays Date is $DATE. This is from William (CJ) vanSchaik")

$IP= (Get-NetIPAddress).ipV4address | select-string "192*"
$USER= get-localuser | select-string "Administrator"
$NAME = hostname
$VERSION = $HOST.Version.Major
$DATE = get-date -displayhint DateTime

Send-Mailmessage -To "vanschwm@mail.uc.edu" -From freezevanschaik@gmail.com -Subject "IT3038" -body $Body -SmtpServer smtp.gmail.com -port 587 -UseSSL -Credential (get-credential) 


