const express = require('express');
// Adding paths
const path = require('path');
// fs interaction with the file system
const fs = require('fs');

const MongoClient = require('mongodb').MongoClient;
const bodyParser = require('body-parser');

const app = express();

// Middlewares
app.use(express.static('public'));

app.use(bodyParser.urlencoded({
  extended: true
}))

app.use(bodyParser.json());

// bind index.htm to the base path
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'index.html'));
});

// get the profile picture and load it
app.get('/profile-picture', (req, res) => {
  const img = fs.readFileSync('cat-picture.jpg');
  // to display response from the HTTP server as HTML
  res.writeHead(200, {'Content-Type': 'image/jpg'});
  // send the cached image as binary data
  res.end(img, 'binary'); //end the response
})

// use when starting application locally
const mongoUrlLocal = "mongodb://mongo-admin:incorrect@127.0.0.1:27017";

// use when starting application as docker container
const mongoUrlDocker = "mongodb://mongo-admin:incorrect@mongodb";

app.post('/update-profile', function (req, res) {
  const userObj = req.body;

  MongoClient.connect(mongoUrlLocal, function (err, client) {
    if (err) throw err;

    let db = client.db('user-account');
    userObj['userid'] = 1;

    let myquery = { userid: 1 };
    let newvalues = { $set: userObj };

    db.collection("user").updateOne(myquery, newvalues, {upsert: true}, function(err, res) {
      if (err) throw err;
      client.close();
    });

  });
  // Send response
  res.send(userObj);
});


// Get the db
app.get('/get-profile', function (req, res) {
  let response = {};
  // Connect to the db
  MongoClient.connect(mongoUrlLocal, function (err, client) {
    if (err) throw err;

    let db = client.db('user-account');

    let myquery = { userid: 1 };

    db.collection("user").findOne(myquery, function (err, result) {
      if (err) throw err;
      response = result;
      client.close();

      // Send response
      res.send(response ? response : {});
    });
  });
});


// listen on the port 3000
app.listen(3000, () => {
  console.log('App listening on port 3000');
});
