const router = require('express').Router();
const con = require('../app/database');

router.post('/create', function(req, res){
    con.query("insert into cabang_restoran set ? ", {
        nama_cabang : req.body.nama_cabang
    })
    res.json(req.body)
})

router.get('/read', function(req, res){
    con.query("select * from cabang_restoran", function(err,cabang_restoran,field){
        res.json(cabang_restoran)
    })
})


router.post('/update/:id?', function(req, res){
    con.query("update cabang_restoran set ? where ?",
    [
        { nama_cabang : req.body.nama_cabang },
        { id : req.params.id }
    ]);
    res.json(req.body)
})

router.get('/delete/:id?', function(req, res){
    con.query("delete from cabang_restoran where ?", {
        id: req.params.id
    });
    res.json('deleted')
})

// create read update delete


module.exports = router;