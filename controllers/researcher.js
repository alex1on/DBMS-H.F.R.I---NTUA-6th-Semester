const { pool } = require('../DBMS-init');

/* Show all Researcher */
exports.getResearchers = (req, res, next) => {
    pool.getConnection((err, conn) => {
        conn.promise().query('SELECT * FROM researcher')
            .then(([rows, fields]) => {
                res.render('researcher.ejs', {
                    pageTitle: "Researchers Page",
                    fields: rows
                })
            })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
    })
}