# Lab 7 Script in PowerShell

======

## How to install and use the PSEverything module for Powershell.

======

###   To install the PSEverything module in Powershell, you will need to open Powershell as an administrator and run the code below. As a dependency you may need to install the Everything application as well.

To run the script you will need to edit the parameters in the code below to match your file system, go to my github repository in the Labs folder to see my [Original Code.](https://github.com/vanschwm/it3038c-scripts/blob/main/labs/PSEverything_Examples_Lab7.psm1)

This script will use the **Search-Everything** module to look for specific file extensions on your system. In this example it is python files. The **(-global)** switch will not only look in one specific directory, but the entire file system. The **(-size)** switch will limit the switch to being between 10 - 209715200 bytes. The **(-pathinclude)** switch will limit your search to a specific directory of your choosing. 
The **(-IncludeTotalCount)** switch will show the total number of files found. The **(-PathExclude)** switch will exclude specific files paths to narrow down your search. The
**(-ParentCount)** switch will narrow down the amount of parent directories that the script will look for. 

After the script is ran, it should go out and look at the C:\ file path for the .py extension and return a list of python files between 10- 209715200 bytes, and show you the full path of the file and the total number of files that were found. 

**Features included in the script:**
<ul>
  <li>(-Extension) Parameter</li>
  <li>(-Global) Parameter</li>
  <li>(-Size) Parameter</li>
  <li>(-PathInclude) Parameter</li>
  <li>(-IncludeTotalCount) Parameter</li>
  <li>(-PathExclude) Parameter</li>
  <li>(-ParentCount) Parameter</li>
</ul>

*Link to install*
[Everything Application](https://www.voidtools.com/downloads/)

*Powershell Command to install PSEverything module:*
```javascript 
Install-Module PSEverything
```
*Powershell code for my script:*
```javascript 
Search-Everything -Extension .py -Global -size 10,2Mb -PathInclude C:\<Your file path> -IncludeTotalCount -PathExclude C:\<Your file path> -ParentCount 9
```
*Use the help page to learn more about the module and parameters for PSEverything.*
```javascript 
get-help search-everything -Full

```

======
