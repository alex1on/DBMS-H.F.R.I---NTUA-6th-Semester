const { pool } = require('../DBMS-init');

/* Show all Organizations */
exports.getOrganizations = (req, res, next) => {
    pool.getConnection((err, conn) => {
        conn.promise().query('SELECT * FROM organization')
            .then(([rows, fields]) => {
                res.render('organization.ejs', {
                    pageTitle: "Organizations Page",
                    fields: rows
                })
            })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
    })
}