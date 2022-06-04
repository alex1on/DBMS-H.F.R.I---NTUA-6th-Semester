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

exports.getProjectInfo = (req, res, next) => {
    //const id = req.body.Project_id;
    //const id = req.param('id');
    const id = req.query.id;
    pool.getConnection((err, conn) => {
        var sqlQuery = `SELECT * FROM project WHERE Project_ID = ${id}`;

        conn.promise().query(sqlQuery).then(([rows, fields]) => {
            res.render('info.ejs', {
                pageTitle: "Project Info",
                fields: rows
            })
        })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
    })
}

/* Controller to delete grade by ID from database */
exports.postDeleteProject = (req, res, next) => {
    /* get id from params */
    const id = req.query.id;

    /* create the connection, execute query, flash respective message and redirect to grades route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `DELETE FROM project WHERE Project_ID = ${id}`;

        conn.promise().query(sqlQuery)
            .then(() => {
                pool.releaseConnection(conn);
                res.redirect('/project');
            })
            .catch(err => {
                res.redirect('/project');
            })
    })

}