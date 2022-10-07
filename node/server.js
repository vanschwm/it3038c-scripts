const http = require("http");
const math = require("mathjs")
const fs = require("fs");
const os = require("os");
const ip = require('ip');
const { uptime } = require("process");
const cpuNumber = os.cpus().length
const memory = math.round(os.totalmem() / (1024 * 1024)) + " (MB)"
const freeMemory = math.round(os.freemem() / (1024 * 1024)) + " (MB)"
const serverUp = ("Days: " + math.floor(os.uptime() / (3600 * 24))) + (", Hours: " + math.floor((os.uptime() % (3600 * 24)) / 3600 )) + (", Minutes: " + math.floor((os.uptime() % 3600) /60)) + (", Seconds: " + math.floor(os.uptime() % 60)) 


http.createServer((req, res) => {
  if (req.url === "/") {
      fs.readFile("./public/index.html", "UTF-8", (err, body) => {
      res.writeHead(200, {"Content-Type": "text/html"});
      res.end(body);
    });
  } else if(req.url.match("/sysinfo")) {
    myHostName=os.hostname();
    html=`
    <!DOCTYPE html>
    <html>
      <head>
        <title>Node JS Response</title>
      </head>
      <body>
        <p>Hostname: ${myHostName}</p>
        <p>IP: ${ip.address()}</p>
        <p>Server Uptime: ${serverUp}</p>
        <p>Total Memory: ${memory}</p>
        <p>Free Memory: ${freeMemory} </p>
        <p>Number of CPUs: ${cpuNumber} </p>
      </body>
    </html>`
    res.writeHead(200, {"Content-Type": "text/html"});
    res.end(html);
  } else {
    res.writeHead(404, {"Content-Type": "text/plain"});
    res.end(`404 File Not Found at ${req.url}`);
  }
}).listen(3000);

console.log("Server listening on port 3000");