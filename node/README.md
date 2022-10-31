# Project 2, Creating a File Upload in Node.js



## How to build and run a formidable file upload form.  


To run the script you will need to edit the parameters in the code below to match your file system (var newpath must match your file system), go to my github repository in the Labs folder to see my [Original Code.](https://github.com/vanschwm/it3038c-scripts/blob/main/node/project2.js)

This formidable Node.js module will create an HTML form that will allow a user to locally host a web site that allows for file uploads. You will upload a file to the form, the file will be temporarily saved on your system in the files variable, using the "parse" parameter, Node will parse the file uploaded for specific information and store it in the "files" parameter to find the old path of the file uploaded. It will then use the "newpath" variable to specify the new location of where the file will be stored locally on your machine. 

You will need to cd into "c:\users\freez\it3038c-scripts\node" and run a "node project2.js" in the terminal to get the HTTP form running on "http:\\localhost:3000". From there you will be able to traverse your file system, choose a file to upload, and submit the upload. Node will then send the file uploaded to the specified location on your machine. Once again, you will need to change the "var newpath" variable to somewhere locally on your machine.

*Code for Node:*
```javascript 
const http = require('http'); //HTTP module
const formidable = require('formidable'); //formidable module to create form
const fs = require('fs'); // fs module to read filepaths / move file paths

http.createServer(function (req, res) {     //creates web server HTTP port 3000
  if (req.url == '/fileupload') {         //checking for the 'file upload' parameter in url
    const file = new formidable.IncomingForm();  // storing form into file variable
    file.parse(req, function (err, fields, files) { // parsing the file for specific information, stored in a temp folder
      const prevpath = files.filetoupload.filepath;  // pulling previous path of the file uploaded
      var newpath = 'C:/Users/Freez/' + files.filetoupload.originalFilename;  // creating new filepath for uploaded file
      fs.rename(prevpath, newpath, function (err) {  //file system module used to specify where the file is being stored 
        if (err) throw err; // if file does not upload successfully, tell us to error
        res.write('File successfully uploaded and moved to local user directory.'); // if file successfully uploads, print that
        res.end();
      });
 });
} 
   else {
    res.writeHead(200, {'Content-Type': 'text/html'}); // code for html of the form 
    res.write('<form action="fileupload" method="post" enctype="multipart/form-data">');  // code for html of the form
    res.write('<input type="file" name="filetoupload"><br>');  // code for html of the form
    res.write('<input type="submit">');   // code for html of the form
    res.write('</form>');    // code for html of the form
    return res.end();
  }
}).listen(3000);

```
*Code referenced from*
```javascript 
https://www.w3schools.com/nodejs/nodejs_uploadfiles.asp

```
