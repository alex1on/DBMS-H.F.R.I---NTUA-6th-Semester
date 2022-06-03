const { pool } = require('../DBMS-init');

/* Show all Programs */
exports.getPrograms = (req, res, next) => {
    pool.getConnection((err, conn) => {
        conn.promise().query('SELECT * FROM program')
            .then(([rows, fields]) => {
                res.render('program.ejs', {
                    pageTitle: "program Page",
                    fields: rows
                })
            })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
    })
}