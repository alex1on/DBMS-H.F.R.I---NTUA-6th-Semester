const { pool } = require('../DBMS-init');

// CRUD Works as intented.

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

exports.postUpdateField = (req, res, next) => {
    const field = req.body.field_type;
    const desc = req.body.field_description;

    pool.getConnection((err, conn) => {
        var sqlQuery = `UPDATE fields SET Field_Description = ? WHERE Field_type = '${field}'`;

        conn.promise().query(sqlQuery, [desc]).then(() => {
            pool.releaseConnection(conn);
            console.log(sqlQuery);
            res.redirect('/fields');
        })
            .catch(err => {
                console.log(err);
                res.redirect('/');
            })
    })
}

/* Controller to delete grade by ID from database */
exports.postDeleteField = (req, res, next) => {
    /* get id from params */
    console.log(req);
    const field = req.query.field;
    console.log(field);

    /* create the connection, execute query, flash respective message and redirect to grades route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `DELETE FROM fields WHERE Field_type = '${field}'`;

        conn.promise().query(sqlQuery)
            .then(() => {
                console.log(sqlQuery);
                pool.releaseConnection(conn);
                res.redirect('/fields');
            })
            .catch(err => {
                console.log(err);
                res.redirect('/fields');
            })
    })

}
/*
exports.postCreateField = (req, res, next) => {

    /* get necessary data sent 
    const field = req.body.field_type_insert;
    const summary = req.body.field_description_insert;
    /* create the connection, execute query, flash respective message and redirect to grades route 
    pool.getConnection((err, conn) => {
        var sqlQuery = `INSERT INTO fields(Field_type, Field_Description) VALUES(?, ?)`;

        conn.promise().query(sqlQuery, [field, summary])
            .then(() => {
                console.log(sqlQuery);
                pool.releaseConnection(conn);
                res.redirect('/fields');
            })
            .catch(err => {
                console.log(err);
                res.redirect('/');
            })
    })
}
*/
exports.postCreatePage = (req, res, next) => {
    res.render('field_create.ejs', {
        pageTitle: 'Create Field'
    });
}

exports.postCreateField = (req, res, next) => {
    const field = req.body.field_type;
    const summary = req.body.field_description;

    pool.getConnection((err, conn) => {
        var sqlQuery = `INSERT INTO fields (Field_type, Field_Description) VALUE(?, ?)`;
        conn.promise().query(sqlQuery, [field, summary])
            .then(() => {
                console.log(sqlQuery);
                pool.releaseConnection(conn);
                res.redirect('/fields');
            })
            .catch(err => {
                console.log(err);
                res.redirect('/fields');
            })
    })
}

exports.getFieldProjects = (req, res, next) => {
    const field = req.query.field;

    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];
    pool.getConnection((err, conn) => {
        var sqlQuery = `SELECT p.Project_ID, p.Title FROM Project p INNER JOIN Describes d ON p.Project_ID = d.Project_ID INNER JOIN Fields f ON d.Field_type = f.Field_type WHERE f.Field_type = '${field}'`;
        conn.promise().query(sqlQuery)
            .then(([rows, project]) => {
                res.render('project.ejs', {
                    pageTitle: "Projects Associating to Field",
                    project: rows,
                    messages: messages
                })
            })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
    })
}

