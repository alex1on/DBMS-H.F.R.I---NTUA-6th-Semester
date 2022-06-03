const { pool } = require('../DBMS-init');

/* Show all Projects */
exports.getProjects = (req, res, next) => {
    pool.getConnection((err, conn) => {
        conn.promise().query('SELECT * FROM project')
            .then(([rows, fields]) => {
                res.render('project.ejs', {
                    pageTitle: "Projects Page",
                    fields: rows
                })
            })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
    })
}