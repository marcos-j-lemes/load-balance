const http = require('http');
const os = require('os');

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end(`Hello from backend on ${os.hostname()}!\n`);
});

server.listen(3000, () => {
  console.log('Backend server running on port 3000');
});