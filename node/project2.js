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

//code referenced from https://www.w3schools.com/nodejs/nodejs_uploadfiles.asp 