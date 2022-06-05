const { pool } = require('../DBMS-init');

// DELETE Works CONSTRAINT WITH EVALUATOR ID
// Create done
// Update OK - Date bad format

/* Show all Researchers */
exports.getResearchers = (req, res, next) => {

    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];
    pool.getConnection((err, conn) => {
        conn.promise().query('SELECT * FROM researcher')
            .then(([rows, researcher]) => {
                res.render('researcher.ejs', {
                    pageTitle: "Researchers Page",
                    researcher: rows,
                    messages: messages
                })
            })
            //.then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
    })
}

exports.postUpdateResearcher = (req, res, next) => {

    /* get necessary data sent */
    const Researcher_ID = req.body.researcher_id;
    const First_Name = req.body.first_name;
    const Last_Name = req.body.last_name;
    const Sex = req.body.sex;
    const age = req.body.age;
    const R_Organization_ID = req.body.r_organization_id;
    const Date_of_entry = req.body.date_of_entry;

    /* create the connection, execute query, flash respective message and redirect to researcher route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `UPDATE Researcher SET First_Name = ?, Last_Name = ?, Sex = ?, R_Organization_ID = ?, Date_of_entry = ? WHERE Researcher_ID = ${Researcher_ID}`;

        conn.promise().query(sqlQuery, [First_Name, Last_Name, Sex, R_Organization_ID, Date_of_entry])
            .then(() => {
                console.log(sqlQuery);
                pool.releaseConnection(conn);
                req.flash('messages', { type: 'success', value: "Successfully updated researcher!" })
                res.redirect('/researcher');
            })
            .catch(err => {
                console.log(err)
                req.flash('messages', { type: 'error', value: "Something went wrong, Researcher could not be updated." })
                res.redirect('/researcher');
            })
    })
}

/* Controller to delete grade by ID from database */
exports.postDeleteResearcher = (req, res, next) => {
    /* get id from params */

    const id = req.query.id;
    console.log(id);

    /* create the connection, execute query, flash respective message and redirect to grades route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `DELETE FROM researcher WHERE Researcher_ID = ${id}`;

        conn.promise().query(sqlQuery)
            .then(() => {
                console.log(sqlQuery);
                pool.releaseConnection(conn);
                res.redirect('/researcher');
            })
            .catch(err => {
                console.log(err);
                res.redirect('/');
            })
    })

}

exports.postCreatePage = (req, res, next) => {
    res.render('researcher_create.ejs', {
        pageTitle: 'Create Researcher'
    });
}

exports.postCreateResearcher = (req, res, next) => {
    const first_name = req.body.first_name;
    const last_name = req.body.last_name;
    const sex = req.body.sex;
    const date = req.body.date_of_birth;
    const dateentry = req.body.date_of_entry;
    const org_id = req.body.org_id;

    pool.getConnection((err, conn) => {
        var sqlQuery = `INSERT INTO researcher (first_name, last_name, sex, date_of_birth, date_of_entry, R_Organization_ID) VALUE(?, ?, ?, ?, ?, ?)`;
        conn.promise().query(sqlQuery, [first_name, last_name, sex, date, dateentry, org_id])
            .then(() => {
                console.log(sqlQuery);
                pool.releaseConnection(conn);
                res.redirect('/researcher');
            })
            .catch(err => {
                console.log(err);
                res.redirect('/researcher');
            })
    })
}