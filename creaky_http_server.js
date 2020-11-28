// sample invocation
// PORT=8080 node creaky_http_server.js

// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/random
function getRandomInt(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min) + min); // The maximum is exclusive and the minimum is inclusive
}

const requestListener = function (req, res) {
  status = getRandomInt(1, 6) * 100;
  console.log(`Sending HTTP status of ${status}`);
  res.writeHead(status);
  res.end(`HTTP status is ${status}\n`);
}

const http = require('http');
const port = process.env.PORT;
if (port === undefined) {
  console.log('PORT not set, exiting');
  process.exit(1);
}
const server = http.createServer(requestListener);
console.log(`Listening on port ${port}`);
server.listen(port);
