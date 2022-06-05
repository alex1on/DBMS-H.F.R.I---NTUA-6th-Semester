const { pool } = require('../DBMS-init');

// CRUD - DONE
// DELETE CONSTRAINTS

/* Show all Executive */
exports.getExecutives = (req, res, next) => {
    pool.getConnection((err, conn) => {
        conn.promise().query('SELECT * FROM executive')
            .then(([rows, executive]) => {
                res.render('executive.ejs', {
                    pageTitle: "Executive Page",
                    executive: rows
                })
            })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
    })
}

exports.postUpdateExecutive = (req, res, next) => {
    const id = req.body.executive_id
    const first_name = req.body.first_name;
    const last_name = req.body.last_name;
    const sex = req.body.sex;

    pool.getConnection((err, conn) => {
        var sqlQuery = `UPDATE Executive SET First_Name = ?, Last_Name = ?, Sex = ? WHERE Executive_ID = ${id}`;

        conn.promise().query(sqlQuery, [first_name, last_name, sex]).then(() => {
            pool.releaseConnection(conn);
            console.log(sqlQuery);
            res.redirect('/executive');
        })
            .catch(err => {
                console.log(err);
                res.redirect('/');
            })
    })
}

/* Controller to delete grade by ID from database */
exports.postDeleteExecutive = (req, res, next) => {
    /* get id from params */
    const id = req.query.id;

    /* create the connection, execute query, flash respective message and redirect to grades route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `DELETE FROM Executive WHERE Executive_ID = ${id}`;

        conn.promise().query(sqlQuery)
            .then(() => {
                console.log(sqlQuery);
                pool.releaseConnection(conn);
                res.redirect('/executive');
            })
            .catch(err => {
                console.log(err);
                res.redirect('/executive');
            })
    })

}

exports.postCreatePage = (req, res, next) => {
    res.render('executive_create.ejs', {
        pageTitle: 'Create Executive'
    });
}

exports.postCreateExecutive = (req, res, next) => {
    const first_name = req.body.first_name;
    const last_name = req.body.last_name;
    const sex = req.body.sex;

    pool.getConnection((err, conn) => {
        var sqlQuery = `INSERT INTO Executive (First_Name, Last_Name, Sex) VALUE(?, ?, ?)`;
        conn.promise().query(sqlQuery, [first_name, last_name, sex])
            .then(() => {
                console.log(sqlQuery);
                pool.releaseConnection(conn);
                res.redirect('/executive');
            })
            .catch(err => {
                console.log(err);
                res.redirect('/executive');
            })
    })
}

exports.getExecutiveProjects = (req, res, next) => {
    const id = req.query.id;

    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];
    pool.getConnection((err, conn) => {
        var sqlQuery = `SELECT p.Project_ID, p.Title FROM Project p INNER JOIN Executive ex ON p.Executive_ID = ex.Executive_ID WHERE 
        ex.Executive_ID = ${id}`;
        conn.promise().query(sqlQuery)
            .then(([rows, project]) => {
                res.render('project.ejs', {
                    pageTitle: "Executive Projects",
                    project: rows,
                    messages: messages
                })
            })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
    })
}
