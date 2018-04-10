var mysql = require("mysql");

let connection = mysql.createConnection
(
    {
        host: "localhost",
        port: 8889,
        database: "restoran",
        user: "root",
        password: "root" ,
    }
);

module.exports = connection;