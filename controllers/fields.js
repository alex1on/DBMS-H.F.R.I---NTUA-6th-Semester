const { pool } = require('../DBMS-init');

/* Show all fields */
exports.getFields = (req, res, next) => {
    pool.getConnection((err, conn) => {
        conn.promise().query('SELECT * FROM fields')
        .then(([rows, fields]) => {
            res.render('fields.ejs', {
                pageTitle: "Fields Page",
                fields: rows
            })
        })
        .then(() => pool.releaseConnection(conn))
        .catch(err => console.log(err))
    })
}