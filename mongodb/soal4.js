const express = require('express');
const app = express();
app.set('view engine', 'ejs')

var MongoClient = require('mongodb').MongoClient
var url = 'mongodb://localhost:27017/kampus';

var db = ''
MongoClient.connect(url, (err, database) => {
  db = database.db('kampus')
})

app.get("/dosen", (req,res) => {
    db.collection("Dosen").find().toArray(
        (err,dosen) => {
        console.log(dosen);
        res.json(dosen);
    })
})

app.get("/mahasiswa", (req,res) => {
    db.collection("Mahasiswa").find().toArray((
        err,mahasiswa) => {
        console.log(mahasiswa);
        res.json(mahasiswa);
    })
})

app.get("/dosen/:namadosen", (req,res) => {
    db.collection("Dosen").find({
        nama : req.params.namadosen
    }).toArray((err,namadosen) => {
        console.log(namadosen);
        res.json(namadosen);
    })
})


app.get("/mahasiswa/:namamahasiswa", (req,res) => {
    db.collection("Mahasiswa").find({
        nama : req.params.id
    }).toArray((err,namamahasiswa) => {
        console.log(namamahasiswa);
        res.json(namamahasiswa);
    })
})

app.listen(3010, console.log('run'))