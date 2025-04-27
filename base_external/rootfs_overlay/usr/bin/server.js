//resource-https://www.geeksforgeeks.org/how-to-run-node-js-server/
//https://www.geeksforgeeks.org/node-js-fs-createreadstream-method/
const http = require('http'); 
const fs = require('fs');

//pipe to read sensor values
const fifoPath = '/tmp/proxpipe';


let latestData="Fetching value from Sensor"

const fifoStream = fs.createReadStream(fifoPath);

fifoStream.on('data', (chunk) => {
    latestData = chunk.toString();
    console.log('Received from pipe:', latestData);
});


//attach error event listener
fifoStream.on('error', (err) => {
    console.error('Error reading from FIFO:', err.message);
});


// Create the server
const server = http.createServer((req, res) => {
    res.writeHead(200, { 'Content-Type': 'text/plain' });
    //update sensor data
	res.end(latestData);
});


// Define the port and host
const port = 8080;
const host = '0.0.0.0';

// Start the server
server.listen(port, host, () => {
    console.log(`Server running at http://${host}:${port}/`);
});
