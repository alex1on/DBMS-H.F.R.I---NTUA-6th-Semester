const { pool } = require('../DBMS-init');

// Delete DONE
// Update
// CREATE DONE
// + special page for each project with all info

/* Show all Projects */
exports.getProjects = (req, res, next) => {
    pool.getConnection((err, conn) => {
        conn.promise().query('SELECT * FROM project')
            .then(([rows, project]) => {
                res.render('project.ejs', {
                    pageTitle: "Projects Page",
                    project: rows
                })
            })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
    })
}

exports.postUpdateProject = (req, res, next) => {
    const id = req.body.project_id;
    const title = req.body.title;
    const summary = req.body.summary;
    const starting_date = req.body.starting_date;
    const ending_date = req.body.ending_date;
    const amount = req.body.amount;
    const grade = req.body.grade;
    const eval_date = req.body.evaluation_date;
    const exec_id = req.body.executive_id;
    const org_id = req.body.organization_id;
    const eval_id = req.body.evaluator_id;
    const program_id = req.body.program_id;


    pool.getConnection((err, conn) => {
        var sqlQuery = `UPDATE Project  SET Title = ?, Summary = ?, Starting_Date = ?, Ending_Date = ?, Amount = ?, Grade = ?, Evaluation_Date = ?, Executive_ID = ?, Organization_ID = ?, Evaluator_ID = ?, Program_ID = ? WHERE Project_ID = ${id}`;

        conn.promise().query(sqlQuery, [title, summary, starting_date, ending_date, amount, grade, eval_date, exec_id, org_id, eval_id, program_id]).then(() => {
            pool.releaseConnection(conn);
            console.log(sqlQuery);
            res.redirect('/project');
        })
            .catch(err => {
                console.log(err);
                res.redirect('/project');
            })
    })
}


/* Controller to delete grade by ID from database */
exports.postDeleteProject = (req, res, next) => {
    /* get id from params */
    const id = req.query.id;

    /* create the connection, execute query, flash respective message and redirect to grades route */
    pool.getConnection((err, conn) => {
        var sqlQuery = `DELETE FROM Project WHERE Project_ID = ${id}`;

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

exports.postCreatePage = (req, res, next) => {
    res.render('project_create.ejs', {
        pageTitle: 'Create project'
    });
}
/*      < !--INSERT INTO project(title, summary, amount, starting_date, ending_date, program_id, executive_id, organization_id, supervisor_id, evaluator_id, grade, evaluation_date)-- >
*/
exports.postCreateProject = (req, res, next) => {
    const title = req.body.title;
    const sum = req.body.summary;
    const amount = req.body.amount;
    const starting_date = req.body.starting_date;
    const ending_date = req.body.ending_date;
    const program_id = req.body.program_id;
    const exec_id = req.body.executive_id;
    const org_id = req.body.organization_id;
    const supervisor_id = req.body.supervisor_id;
    const eval_id = req.body.evaluator_id;
    const grade = req.body.grade;
    const eval_date = req.body.eval_date;

    /*      < !--INSERT INTO project(title, summary, amount, starting_date, ending_date, program_id, executive_id, organization_id, supervisor_id, evaluator_id, grade, evaluation_date)-- > */
    pool.getConnection((err, conn) => {
        var sqlQuery = `INSERT INTO project (Title, Summary, Amount, Starting_Date, Ending_Date, Program_ID, Executive_ID, Organization_ID, Supervisor_ID, Evaluator_ID, Grade, Evaluation_Date) VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`;
        conn.promise().query(sqlQuery, [title, sum, amount, starting_date, ending_date, program_id, exec_id, org_id, supervisor_id, eval_id, grade, eval_date])
            .then(() => {
                console.log(sqlQuery);
                pool.releaseConnection(conn);
                res.redirect('/project');
            })
            .catch(err => {
                console.log(err);
                res.redirect('/project');
            })
    })
}

exports.getShowResearchers = (req, res, next) => {
    const id = req.query.id;

    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];
    pool.getConnection((err, conn) => {
        var sqlQuery = `SELECT * FROM Researcher r INNER JOIN Works_On w ON r.Researcher_ID = w.Researcher_ID INNER JOIN Project p ON w.Project_ID = p.Project_ID WHERE p.Project_ID = ${id}`;
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

exports.getShowFields = (req, res, next) => {
    const id = req.query.id;

    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];
    pool.getConnection((err, conn) => {
        var sqlQuery = `SELECT f.Field_type, f.Field_Description FROM Fields f INNER JOIN Describes d ON d.Field_type = f.Field_type INNER JOIN Project p ON p.Project_ID = d.Project_ID WHERE p.Project_ID = ${id}`;
        conn.promise().query(sqlQuery)
            .then(([rows, fields]) => {
                res.render('fields.ejs', {
                    pageTitle: "Researchers Working on Project",
                    fields: rows,
                    messages: messages
                })
            })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
    })
}

exports.getDeliverableInfo = (req, res, next) => {
    //const id = req.body.Project_id;
    //const id = req.param('id');
    const id = req.query.id;
    pool.getConnection((err, conn) => {
        var sqlQuery = `SELECT d.Deliverable_ID, d.Title, d.Delivery_Date, d.Summary, d.Delivery_Date, d.Project_ID FROM Deliverable d INNER JOIN Project p ON d.Project_ID = p.Project_ID WHERE p.Project_ID = ${id}`;

        conn.promise().query(sqlQuery).then(([rows, project]) => {
            console.log(sqlQuery);
            res.render('info.ejs', {
                pageTitle: "Deliverable Info",
                project: rows
            })
        })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
    })
}

exports.postDeleteDeliverable = (req, res, next) => {
    const id = req.query.id;
    pool.getConnection((err, conn) => {
        var sqlQuery = `DELETE FROM Deliverable WHERE Deliverable_ID = ${id}`;
        conn.promise().query(sqlQuery).then(() => {
            pool.releaseConnection(conn);
            console.log(sqlQuery);
            res.redirect('/project');
        })
            .catch(err => {
                console.log(err);
                res.redirect('/project');
            })
    })
}

exports.postUpdateDeliverable = (req, res, next) => {
    const id = req.body.deliverable_id;
    const title = req.body.title;
    const summary = req.body.summary;
    const date = req.body.delivery_date;
    pool.getConnection((err, conn) => {
        var sqlQuery = `UPDATE Deliverable SET Title = ?, Summary = ?, Delivery_Date = ? WHERE Deliverable_ID = ${id}`;
        conn.promise().query(sqlQuery, [title, summary, date]).then(() => {
            pool.releaseConnection(conn);
            console.log(sqlQuery);
            res.redirect('/project')
        })
            .catch(err => {
                console.log(err);
                res.redirect('/project');
            })
    })
}

exports.getCreateDeliverablePage = (req, res, next) => {
    res.render('deliverable_create.ejs', {
        pageTitle: 'Create Deliverable'
    });
}

exports.postCreateDeliverable = (req, res, next) => {
    const id = req.body.project_id;
    const title = req.body.title;
    const summary = req.body.summary;
    const date = req.body.delivery_date;

    pool.getConnection((err, conn) => {
        var sqlQuery = `INSERT INTO Deliverable (Project_ID, Title, Summary, Delivery_Date) VALUE(?, ?, ?, ?)`;
        conn.promise().query(sqlQuery, [id, title, summary, date])
            .then(() => {
                console.log(sqlQuery);
                pool.releaseConnection(conn);
                res.redirect('/project');
            })
            .catch(err => {
                console.log(err);
                res.redirect('/project');
            })
    })
}