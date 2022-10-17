# MARKDOWN EXAMPLE 

======

### How to install and use the PSEverything module for Powershell.

======

To install the PSEverything module in Powershell, you will need to open Powershell as an administrator and run the code below. As a dependency you may need to install the Everything application as well.

```javascript 
Link to Everything installation file:
https://www.voidtools.com/downloads/

Powershell Command to install PSEverything module:
Install-Module PSEverything

Powershell code for my script:
Search-Everything -Extension .py -Global -size 10,2Mb -PathInclude C:\users\Freez\OneDrive -IncludeTotalCount -PathExclude C:\users\freez\.vscode -ParentCount 9

This script will use the "Search-Everything" module to look for specific file extensions on your system. In this example it is python files. The -global switch will not only look in one specific directory, but the entire file system.
The -size switch will limit the switch to being between 10 - 209715200 bytes. The -pathinclude switch will limit your search to a specific directory of your choosing. 
The -IncludeTotalCount switch will show the total number of files found. The -PathExclude switch will exclude specific files paths to narrow down your search. The
-ParentCount switch will narrow down the amount of parent directories that the script will look for.

Use the "get-help search-everything -Full" command to learn more about the module and parameters. 

```

======
