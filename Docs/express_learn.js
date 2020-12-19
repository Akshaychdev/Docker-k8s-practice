import Express from "express";

// That imports Express form the downloaded node module

// The express
const app = Express();
// Add a port
const port = 3000;

// GET, POST, PUT, DELETE

// The four basic operation now

// app.get();
// app.post();
// app.delete
// app.put

// 1. using get
// get accepts 3 arguments , 1)the path('/':- main path), 3)middleware(optional), 3)(request, response),
// request is all the info coming in, response is to send data out.
// Doing a hello world in express
/*
app.get("/", (req, res) => {
  res.send('Hello World');
})
*/
app.get("/", (req, res) => {
  res.send('Hello World');
})

// Listen to the port with a callback optional
app.listen(port, () => console.log('Listening to port ' + port));

// Now on port 3000(127.0.0.1:3000) it is Hello World
