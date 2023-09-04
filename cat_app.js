// cat_app.js
const http = require("http");
const fs = require("fs");

const server = http.createServer((req, res) => {
  res.writeHead(200, { "Content-Type": "text/html" });
  const html = `
        <html>
        <body>
            <h1>Hello, this is a Cat app(testAPP2)</h1>
            <img src="https://res.cloudinary.com/dk-find-out/image/upload/q_80,w_1920,f_auto/DCTM_Penguin_UK_DK_AL697473_RGB_PNG_namnse.jpg" alt="Cat" />
        </body>
        </html>
    `;
  res.end(html);
});

server.listen(3000, () => {
  console.log("Cat app running on port 3000");
});
