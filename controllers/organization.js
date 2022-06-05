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

