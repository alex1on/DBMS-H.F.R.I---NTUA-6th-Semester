const { pool } = require('../DBMS-init');

exports.getHome = (req, res, next) => {
    res.render('HomePage.ejs')
}

exports.getField = (req, res, next) => {
    pool.getConnection((err, conn) => {
        conn.promise().query('SELECT * FROM fields')
            .then(([rows, fields]) => {
                res.render('field_choose.ejs', {
                    pageTitle: "Choose Field",
                    fields: rows
                })
            })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
    })
}