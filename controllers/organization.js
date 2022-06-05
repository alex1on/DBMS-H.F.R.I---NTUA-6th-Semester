const { pool } = require('../DBMS-init');

// DELETE OK - CONSTRAINTS
// CREATE OK - many null though
// UPDATE OK - BUT MUST HAVE 2 PHONES, PROBLEM WITH NEW ORGANIZATIONS

/* Show all Organizations */
exports.getOrganizations = (req, res, next) => {
    pool.getConnection((err, conn) => {
        conn.promise().query('SELECT * FROM organization')
            .then(([rows, fields]) => {
                res.render('organization.ejs', {
                    pageTitle: "Organizations Page",
                    organization: rows
                })
            })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
    })
}

exports.postUpdateOrganization = (req, res, next) => {
    const id = req.body.organization_id;
    const name = req.body.organization_name;
    const abbr = req.body.abbreviation;
    const str = req.body.street_name;
    const strnum = req.body.street_number;
    const zipcode = req.body.zip_code;
    const city = req.body.city;
    const org_type = req.body.organization_type;


    pool.getConnection((err, conn) => {
        var sqlQuery = `UPDATE Organization  SET Organization_Name = ?, Abbreviation = ?, Street_Name = ?, Street_Number = ?, Zip_Code = ?, City = ?, Organization_Type = ? WHERE Organization_ID = ${id}`;

        conn.promise().query(sqlQuery, [name, abbr, str, strnum, zipcode, city, org_type]).then(() => {
            pool.releaseConnection(conn);
            console.log(sqlQuery);
            res.redirect('/organization');
        })
            .catch(err => {
                console.log(err);
                res.redirect('/');
            })
    })
}

/* Controller to delete grade by ID from database */
exports.postDeleteOrganization = (req, res, next) => {
    /* get id from params */

    const id = req.query.id;

    /* create the connection, execute query, flash respective message and redirect to grades route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `DELETE FROM Organization WHERE Organization_ID = ${id}`;

        conn.promise().query(sqlQuery)
            .then(() => {
                console.log(sqlQuery);
                pool.releaseConnection(conn);
                res.redirect('/organization');
            })
            .catch(err => {
                console.log(err);
                res.redirect('/organization');
            })
    })

}

exports.postCreatePage = (req, res, next) => {
    res.render('organization_create.ejs', {
        pageTitle: 'Create Organization'
    });
}

exports.postCreateOrganization = (req, res, next) => {
    const name = req.body.organization_name;
    const abbr = req.body.abbreviation;
    const str = req.body.street_name;
    const strnum = req.body.street_number;
    const zipcode = req.body.zip_code;
    const city = req.body.city;
    const org_type = req.body.organization_type;

    pool.getConnection((err, conn) => {
        var sqlQuery = `INSERT INTO organization (Organization_Name, Abbreviation, Street_Name, Street_Number, Zip_Code, City, Organization_Type) VALUE(?, ?, ?, ?, ?, ?, ?)`;
        conn.promise().query(sqlQuery, [name, abbr, str, strnum, zipcode, city, org_type])
            .then(() => {
                console.log(sqlQuery);
                pool.releaseConnection(conn);
                res.redirect('/organization');
            })
            .catch(err => {
                console.log(err);
                res.redirect('/organization');
            })
    })
}

exports.getShowResearchers = (req, res, next) => {
    const id = req.query.id;

    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];
    pool.getConnection((err, conn) => {
        var sqlQuery = `SELECT * FROM Researcher r INNER JOIN Organization o ON r.R_Organization_ID = o.Organization_ID 
        WHERE o.Organization_ID = ${id}`;
        conn.promise().query(sqlQuery)
            .then(([rows, researcher]) => {
                res.render('researcher.ejs', {
                    pageTitle: "Researchers Working on Project",
                    researcher: rows,
                    messages: messages
                })
            })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
    })
}

exports.getShowPhones = (req, res, next) => {
    const id = req.query.id;

    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];
    pool.getConnection((err, conn) => {
        var sqlQuery = `SELECT ph.Phone_number FROM Phones ph INNER JOIN Organization o ON ph.Organization_ID = o.Organization_ID WHERE o.Organization_ID = ${id}`;
        conn.promise().query(sqlQuery)
            .then(([rows, phones]) => {
                res.render('phones.ejs', {
                    pageTitle: "Researchers Working on Project",
                    phones: rows,
                    messages: messages
                })
            })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
    })
}


exports.postUpdatePhone = (req, res, next) => {
    const old_phone = req.body.phone_number;
    const new_phone = req.body.new_phone_number;

    pool.getConnection((err, conn) => {
        var sqlQuery = `UPDATE Phones SET Phone_number = ? WHERE Phone_number = '${old_phone}'`;

        conn.promise().query(sqlQuery, [new_phone]).then(() => {
            pool.releaseConnection(conn);
            console.log(sqlQuery);
            res.redirect('/organization');
        })
            .catch(err => {
                console.log(err);
                res.redirect('/organization');
            })
    })
}

exports.postDeletePhone = (req, res, next) => {
    const phone = req.query.phone;

    pool.getConnection((err, conn) => {
        var sqlQuery = `DELETE FROM Phones WHERE Phone_number = '${phone}'`;

        conn.promise().query(sqlQuery).then(() => {
            pool.releaseConnection(conn);
            console.log(sqlQuery);
            res.redirect('/organization');
        })
            .catch(err => {
                console.log(err);
                res.redirect('/organization');
            })
    })
}


exports.getCreatePhonePage = (req, res, next) => {
    res.render('phone_create.ejs', {
        pageTitle: 'Create Phone'
    });
}

exports.postCreatePhone = (req, res, next) => {
    const id = req.body.organization_id;
    const phone = req.body.phone_number;

    pool.getConnection((err, conn) => {
        var sqlQuery = `INSERT INTO Phones (Organization_ID, Phone_number) VALUE(?, ?)`;
        conn.promise().query(sqlQuery, [id, phone])
            .then(() => {
                console.log(sqlQuery);
                pool.releaseConnection(conn);
                res.redirect('/organization');
            })
            .catch(err => {
                console.log(err);
                res.redirect('/organization');
            })
    })
}

exports.getOrganizationProjects = (req, res, next) => {
    const id = req.query.id;

    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];
    pool.getConnection((err, conn) => {
        var sqlQuery = `SELECT p.Project_ID, p.Title FROM Project p INNER JOIN Organization o ON o.Organization_ID = p.Organization_ID WHERE o.Organization_ID = ${id}`;
        conn.promise().query(sqlQuery)
            .then(([rows, project]) => {
                res.render('project.ejs', {
                    pageTitle: "Projects Belonging to the Organization",
                    project: rows,
                    messages: messages
                })
            })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
    })
}