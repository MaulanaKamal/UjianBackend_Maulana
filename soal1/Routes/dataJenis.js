const router = require('express').Router();
const con = require('../app/database');

router.post('/create/:id?', function(req, res){
    con.query("SELECT * from kategori where ?", {
        id : req.params.id
    },
    function(err,kategoriid) {
        con.query("insert into jenis set ?", {
            kategori_id : kategoriid[0].id,
            jenis_makanan : req.body.jenis_makanan,
        });
        res.json(req.body)
    })
})

router.get('/read/:id?', function(req, res){
        con.query("SELECT * from kategori where ?", {
            id : req.params.id
        }, function(err,rows1) {
            con.query('select * from jenis where ?', {
                kategori_id : req.params.id,
            }, function(err,rows2) {
                res.json(rows2) 
            });
        })  
})


router.post('/update/:id?', function(req, res){
        con.query("select * from jenis where ?", {
            id : req.params.id
        },
        function(err,jenisid) {
            con.query("update jenis set ? where ?",
            [
                { jenis_makanan : req.body.jenis_makanan, },
                { id : jenisid[0].id, }
            ]);
            res.json(req.body)
        })
})

router.get('/delete/:id?', function(req, res){
        con.query("select * from jenis where ?", {
            id : req.params.id
        },
        function(err,jenisid) {
            con.query("DELETE FROM jenis where ?", {
                id: jenisid[0].id
            });
            res.json('deleted')
        })    
})

module.exports = router;
