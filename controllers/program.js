const { pool } = require('../DBMS-init');

// CRUD - Works, ON DELETE CONSTRAINTS

/* Show all Programs */
exports.getPrograms = (req, res, next) => {
    pool.getConnection((err, conn) => {
        conn.promise().query('SELECT * FROM program')
            .then(([rows, Programs]) => {
                res.render('program.ejs', {
                    pageTitle: "Program Page",
                    program: rows
                })
            })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
    })
}

exports.postUpdateProgram = (req, res, next) => {
    const id = req.body.program_id;
    const name = req.body.program_name;
    const address = req.body.hfri_address;

    pool.getConnection((err, conn) => {
        var sqlQuery = `UPDATE Program SET  Program_name = ?, HFRI_Address = ? WHERE Program_ID = ${id}`;

        conn.promise().query(sqlQuery, [name, address]).then(() => {
            console.log(sqlQuery);
            pool.releaseConnection(conn);
            console.log(sqlQuery);
            res.redirect('/program');
        })
            .catch(err => {
                console.log(err);
                res.redirect('/');
            })
    })
}

/* Controller to delete grade by ID from database */
exports.postDeleteProgram = (req, res, next) => {
    /* get id from params */
    const id = req.query.id;
    console.log(id);

    /* create the connection, execute query, flash respective message and redirect to grades route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `DELETE FROM Program WHERE Program_ID = ${id}`;

        conn.promise().query(sqlQuery)
            .then(() => {
                console(sqlQuery);
                console.log(sqlQuery);
                pool.releaseConnection(conn);
                res.redirect('/program');
            })
            .catch(err => {
                console.log(err);
                res.redirect('/program');
            })
    })

}

exports.postCreatePage = (req, res, next) => {
    res.render('program_create.ejs', {
        pageTitle: 'Create Program'
    });
}

exports.postCreateProgram = (req, res, next) => {
    const id = req.body.program_id;
    const name = req.body.program_name;
    const address = req.body.hfri_address;

    pool.getConnection((err, conn) => {
        var sqlQuery = `INSERT INTO Program (Program_ID, Program_name, HFRI_Address) VALUE(?, ?, ?)`;
        conn.promise().query(sqlQuery, [id, name, address])
            .then(() => {
                console.log(sqlQuery);
                pool.releaseConnection(conn);
                res.redirect('/program');
            })
            .catch(err => {
                console.log(err);
                res.redirect('/');
            })
    })
}

exports.getShowProjects = (req, res, next) => {
    const id = req.query.id;

    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];
    pool.getConnection((err, conn) => {
        var sqlQuery = `SELECT p.Project_ID, p.Title FROM Project p INNER JOIN Program pr ON p.Program_ID = pr.Program_ID 
        WHERE pr.Program_ID = ${id}`;
        conn.promise().query(sqlQuery)
            .then(([rows, researcher]) => {
                res.render('project.ejs', {
                    pageTitle: "Project Funded by this Program",
                    project: rows,
                    messages: messages
                })
            })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
    })
}
