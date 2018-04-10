const router = require('express').Router();
const con = require('../app/database');

router.post('/create/:id?', function(req, res){
    con.query("SELECT * from jenis where ?", {
        id : req.params.id
    },
    function(err,jenisid) {
        con.query("insert into menu set ?", {
            jenis_id : jenisid[0].id,
            menu_makanan : req.body.menu_makanan,
            harga : req.body.harga
        });
        res.json(req.body)
    })
})

router.get('/read/:id?', function(req, res){
        con.query("SELECT * from jenis where ?", {
            id : req.params.id
        }, function(err,rows1) {
            con.query('select * from menu where ?', {
                jenis_id : req.params.id,
            }, function(err,rows2) {
                res.json(rows2) 
            });
        })  
})


router.post('/update/:id?', function(req, res){
        con.query("select * from menu where ?", {
            id : req.params.id
        },
        function(err,menuid) {
            con.query("update menu set ? where ?",
            [
                { 
                    menu_makanan : req.body.menu_makanan,
                    harga : req.body.harga 
                },
                { id : menuid[0].id, }
            ]);
            res.json(req.body)
        })
})

router.get('/delete/:id?', function(req, res){
        con.query("select * from menu where ?", {
            id : req.params.id
        },
        function(err,menuid) {
            con.query("DELETE FROM menu where ?", {
                id: menuid[0].id
            });
            res.json('deleted')
        })    
})

module.exports = router;
