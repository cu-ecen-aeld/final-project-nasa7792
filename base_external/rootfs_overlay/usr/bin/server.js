const fs = require('fs');
const http = require('http');

const hostname = '0.0.0.0';
const port = 8080;
const pipePath = '/tmp/proxpipe';

let latestData = 'Waiting for sensor data...';
let buffer = '';

// Function to open and monitor the FIFO
function openFifo() {
  const stream = fs.createReadStream(pipePath, { encoding: 'utf8', flags: 'r+' });

  stream.on('data', chunk => {
    buffer += chunk;
    let lines = buffer.split('\n');
    buffer = lines.pop() || '';
    if (lines.length > 0) {
      latestData = lines[lines.length - 1].trim();
      console.log('Received:', latestData);
    }
  });

  stream.on('end', () => {
    console.log('FIFO stream ended, reopening in 1 second...');
    setTimeout(openFifo, 1000); // Try to reopen after a short delay
  });

  stream.on('error', err => {
    console.error('FIFO error:', err.message);
    // If the FIFO does not exist yet, try again soon
    setTimeout(openFifo, 1000);
  });
}

// Start the FIFO reader
openFifo();

// Create the HTTP server
const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end(`Latest sensor reading: ${latestData}`);
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});
