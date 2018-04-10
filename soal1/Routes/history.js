const router = require('express').Router();
const con = require('../app/database');

router.post('/create', function(req, res) {
    con.query("insert into history set ?", {
        nama_stock : req.body.nama_stock,
        user : req.body.user,
        waktu_transaksi : new Date,
    });
    res.json(req.body)
})

router.get('/read', function(req, res){
    con.query("select * from history", 
    function(err,history,field){
        res.json(history)
    })
})


module.exports = router;