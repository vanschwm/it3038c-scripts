# Final Project - Compare the SHA-256 Hash of Two Files

##   Description of how this PowerShell Script works

To run the script you will need to edit a few parameters in the script to match your file system, go to my github repository in the Labs folder to see my [Original Code.](https://github.com/vanschwm/it3038c-scripts/blob/main/Final_project/Final_Project_vanschwm.ps1)

This is a powershell script that is used to check the file hashes of two different files to see if they are the same or if they have been changed. A main use case scenario for this would be to ensure the integrity of your system. In this example, we are recursively checking **"C:\Program Files"** for all **.exe's**, storing their hashes in a text file and then running the check again, storing the hashes in a new file (preferably at a later time) and then comparing the file hashes and checking if any modifications have been made. If modifications to the file hash have been made, you will be told that a change was found. If no change was found, you will be told that everything is okay.

### How to run the script

* **1.** First, you will need to download the .ps1 file that is located in my [GitHub repository.](https://github.com/vanschwm/it3038c-scripts/blob/main/Final_project/Final_Project_vanschwm.ps1)
* **2.** One way to do this would be to copy and past my code from my repository in the step above or reference the bottom of this README and directly copy from the javascript block. 
* **3.** You will need to open PowerShell ISE as an admin and POTENTIALLY allow the execution of local scripts on your machine. To do this, follow this [link.](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.3)
* **4.** From there, you will need to open an ISE file and copy / paste the contents of my code into the file. 
* **5.** Save the .ps1 script locally on your machine. (Name it what you want)
* **6.** You will then need to add a new folder "File_Hash" on your C Drive. (C:\File_Hash)
* **7.** You will also want to create the text files "Original_Hash.txt" and "Comparable_Hash.txt" inside of your "C:\File_Hash" folder. (C:\File_Hash\Original_Hash.txt && C:\File_Hash\Comparable_Hash.txt)
* **8.** Finally, you will click the green "play" button that says "run script" to fully execute the script.

## How to view the script working

**To watch the script do its magic, you will need to:**
* **1.** Open the "C:\File_Hash" directory
* **2.** You will then be able to view the "Original_Hash.txt" and "Comparable_Hash.txt" and you will see the contents of the data being re-written.
* **3.** You will also see the "equal.txt" file or the "unequal.txt" file populate within this directory. 

## Side Notes

**If you would like to run this script at boot, there are options to do so (which is what I am currently doing). To do this, you will need to do the following.**

* **1.** Create a ".cmd" file titled "hash.cmd". (this can be done in notepad, make sure to save as .cmd file)
* **2.** Inside of the .cmd file you will need to input the text "powerShell C:\Final_Project_vanschwm.ps1" (The name of this file will be different for you as you would need to save the script locally on your machine.)
* **3.** You will then need to place this ".cmd" file inside of the directory at >> C:\Users\<user_name>\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup

**You are also able to re-engineer the script to not only check your program files, but any file(s) you wish to compare the hashes of. I will let you figure that out on your own (:**

### Features included in the script:
<ul>
  <li>Powershell variables</li>
  <li>If / else statement</li>
  <li>Get-FileHash</li>
  <li>Get-ChildItem</li>
  <li>Get-Date</li>
  <li>Add-Content</li>
  <li>Write-Host</li>
  <li>(-Recursive)</li>
  <li>(-Path)</li>
  <li>(-eq)</li>
  <li>(-Filter)</li>
</ul>

*Powershell code for my script:*
```javascript 
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
```
