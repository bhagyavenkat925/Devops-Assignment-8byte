const http = require('http');
const port = process.env.PORT || 80;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.end('Hello from Bhagyashree\'s CI/CD pipeline 🎉');
});

server.listen(port, () => {
  console.log(`Server running at http://localhost:${port}/`);
});