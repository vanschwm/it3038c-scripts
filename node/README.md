# Project 2, Creating a File Upload in Node.js



## How to build and run a formidable file upload form.  


To run the script you will need to edit the parameters in the code below to match your file system (var newpath must match your file system), go to my github repository in the Labs folder to see my [Original Code.](https://github.com/vanschwm/it3038c-scripts/blob/main/node/project2.js)

This formidable Node.js module will create an HTML form that will allow a user to locally host a web site that allows for file uploads. You will upload a file, and the file will be temporarily saved on your system in the files variable, using the "fs" module, Node will parse the file uploded for specific information of the file stored in the "files" parameter find the old path of the file uploaded and will 

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
