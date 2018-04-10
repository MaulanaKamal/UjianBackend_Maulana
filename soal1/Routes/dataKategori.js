const router = require('express').Router();
const con = require('../app/database');

router.post('/create/:id?', function(req, res){
    con.query("SELECT * from cabang_restoran where ?", {
        id : req.params.id
    },
    function(err,cabang_restoranid) {
        con.query("insert into kategori set ?", {
            cabang_restoran_id : cabang_restoranid[0].id,
            kategori_makanan : req.body.kategori_makanan,
        });
        res.json(req.body)
    })
})

router.get('/read/:id?', function(req, res){
        con.query("SELECT * from cabang_restoran where ?", {
            id : req.params.id
        }, function(err,rows1) {
            con.query('select * from kategori where ?', {
                cabang_restoran_id : req.params.id,
            }, function(err,rows2) {
                res.json(rows2) 
            });
        })  
})

router.get('/edit/:id?', function(req, res){
        res.json(id)
})

router.post('/update/:id?', function(req, res){
        con.query("SELECT * FROM kategori where ?", {
            id : req.params.id
        },
        function(err,kategoriid) {
            con.query("update kategori set ? where ?",
            [
                { kategori_makanan : req.body.kategori_makanan, },
                { id : req.params.id, }
            ]);
            res.json(req.body)
        })
})

router.get('/delete/:id?', function(req, res){
        con.query("SELECT * FROM kategori where ?", {
            id : req.params.id
        },
        function(err,kategoriid) {
            con.query("DELETE FROM kategori where ?", {
                id: kategoriid[0].id
            });
            res.json('deleted')
        })    
})

module.exports = router;
