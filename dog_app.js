// dog_app.js
const http = require("http");
const fs = require("fs");

const server = http.createServer((req, res) => {
  res.writeHead(200, { "Content-Type": "text/html" });
  const html = `
        <html>
        <body>
            <h1>Hello, this is a Dog app (testAPP1)</h1>
            <img src="https://hips.hearstapps.com/hmg-prod/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=0.752xw:1.00xh;0.175xw,0&resize=1200:*" alt="Dog" />
        </body>
        </html>
    `;
  res.end(html);
});

server.listen(3000, () => {
  console.log("Dog app running on port 3000");
});
