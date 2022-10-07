const path = require("path");

console.log("hello, World")

const hello = "Hello from Node JS Variable!"
console.log(hello)

console.log(`Printing Variable Hello: ${hello}`);

console.log("dir name: " + __dirname);
console.log("dir and file name :" + __filename);

console.log("Using PATH module:");
console.log(`Hello from file ${path.basename(__filename)}`);

console.log(`process args: ${process.argv}`);