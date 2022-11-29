$Comparable_Hash = "C:\File_Hash\Comparable_Hash.txt" # Variable to store new hash value of "Get-ChildItem -Path 'C:\Program Files' -Recurse -Filter *.exe | Get-FileHash > $Comparable_Hash".


$Datetime = Get-Date                                  # Variable to add date and time of success and failure of hash checksum.


# Recursively check C:\Program Files for all .exe's and get the file hash of each and upload them to a text file "C:\File_Hash\Original_Hash.txt" for our original hash.
Get-ChildItem -Path 'C:\Program Files' -Recurse -Filter *.exe | Get-FileHash > C:\File_Hash\Original_Hash.txt 


# Recursively check C:\Program Files for all .exe's (again, as a comparision to the original checksum) and store them in the $Comparable_Hash variable.
Get-ChildItem -Path 'C:\Program Files' -Recurse -Filter *.exe | Get-FileHash > $Comparable_Hash


# Variable that checks the hash of the "Original_Hash.txt" file created earlier.
$Original = Get-FileHash -Path C:\File_Hash\Original_Hash.txt


# Variable that checks the hash of the "Comparable_Hash.txt" file created earlier.
$Comparable = Get-FileHash -Path C:\File_Hash\Comparable_Hash.txt



# If, else statement that checks the hash of the "$Original" variable against the "$Comparison" variable to see if they are the same or different.
If ($Original.hash -eq $Comparable.hash) # If they are EQUAL
{
    # Add a new file in the directory you created called "equal.txt", inside the file should print the date and time that it was checked, and the message "Hash has not changed, your files are safe."
    # Write to console the same message as the "equal.txt file"
    Add-Content -Path C:\File_Hash\equal.txt -Value "$Datetime : Hash has not changed, your files are safe."
    Write-Host "$Datetime Hash has not changed, your files are safe."
}
else # If hash is NOT EQUAL
{
    # Add a new file in the directory you created called "unequal.txt", inside the file should print the date and time that it was checked, and the message "Hash has changed, please ensure integrity of your system."
    # Write to console the same message as the "unequal.txt file"
    Add-Content -Path C:\File_Hash\unequal.txt -Value "$Datetime : Hash has changed, please ensure integrity of your system."
    Write-Host "$Datetime Hash has changed, please ensure integrity of your system."

}