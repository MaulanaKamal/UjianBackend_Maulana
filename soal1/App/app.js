var express = require('express');
var app = express();

var session = require('express-session');
app.use(session({secret: 'ssshhhhh'}));
var sess;

const crypto = require('crypto');
const secret = 'abcdefg';

app.set('view engine', 'ejs');

var bodyParser = require('body-parser')
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));


    
// ADMIN CABANG RESTORAN____________________________________________
var dataCabang = require('../Routes/dataCabang')
app.use('/datacabang', dataCabang)

// ADMIN KATEGORI MAKANAN____________________________________________
var dataKategori = require('../Routes/dataKategori')
app.use('/datakategori', dataKategori)

// ADMIN JENIS MAKANAN____________________________________________
var dataJenis = require('../Routes/dataJenis')
app.use('/datajenis', dataJenis)

// ADMIN MENU MAKANAN____________________________________________
var dataMenu = require('../Routes/datamenu')
app.use('/datamenu', dataMenu)

// DATA KARYAWAN____________________________________________
var karyawan = require('../Routes/karyawan')
app.use('/karyawan', karyawan)

// DATA HISTORY____________________________________________
var history = require('../Routes/history')
app.use('/history', history)


app.listen(3030,(console.log('run')))