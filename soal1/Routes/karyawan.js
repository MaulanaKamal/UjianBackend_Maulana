const router = require('express').Router();
const con = require('../app/database');

router.post('/create/:id?', function(req, res){
    con.query("SELECT * from cabang_restoran where ?", {
        id : req.params.id
    },
    function(err,cabangrestoranid) {
        con.query("insert into karyawan set ?", {
            restoran_id : cabangrestoranid[0].id,
            nama : req.body.nama,
            gaji : req.body.gaji,
            role : req.body.role,
            gender : req.body.gender,
        });
        res.json(req.body)
    })
})

router.get('/read/:id?', function(req, res){
        con.query("SELECT * from cabang_restoran where ?", {
            id : req.params.id
        }, function(err,rows1) {
            con.query('select * from karyawan where ?', {
                restoran_id : rows1[0].id,
            }, function(err,rows2) {
                res.json(rows2) 
            });
        })  
})


router.post('/update/:id?', function(req, res){
        con.query("select * from karyawan where ?", {
            id : req.params.id
        },
        function(err,karyawanid) {
            con.query("update karyawan set ? where ?",
            [
                { 
                    nama : req.body.nama,
                    gaji : req.body.gaji,
                    role : req.body.role,
                    gender : req.body.gender
                },
                { id : karyawanid[0].id, }
            ]);
            res.json(req.body)
        })
})

router.get('/delete/:id?', function(req, res){
        con.query("select * from karyawan where ?", {
            id : req.params.id
        },
        function(err,karyawanid) {
            con.query("DELETE FROM karyawan where ?", {
                id: karyawanid[0].id
            });
            res.json('deleted')
        })    
})

module.exports = router;
