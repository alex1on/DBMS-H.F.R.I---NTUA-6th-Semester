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

exports.getProjectInfo = (req, res, next) => {
    //const id = req.body.Project_id;
    //const id = req.param('id');
    const id = req.query.id;
    pool.getConnection((err, conn) => {
        var sqlQuery = `	SELECT DISTINCT p.Project_ID, p.Title, p.Summary, DATE_FORMAT(p.Starting_Date,"%Y-%m-%d") AS Starting_Date, DATE_FORMAT(p.Ending_Date,"%Y-%m-%d") AS Ending_Date, p.Amount, p.Grade, DATE_FORMAT(p.Evaluation_Date,"%Y-%m-%d") AS Evaluation_Date, ex.Executive_ID, ex.First_Name, ex.Last_Name, o.Organization_ID, o.Organization_Name, sv.Researcher_ID, sv.First_Name, sv.Last_Name, ev.Researcher_ID, ev.First_Name, ev.Last_Name, pr.Program_ID, pr.Program_name, p.duration, p.Active, d.Deliverable_ID, d.Title, d.Delivery_Date, r.Researcher_ID,r.First_Name, r.Last_Name, field.Field_type
	FROM Project p
	INNER JOIN Works_ON w ON w.Project_ID = p.Project_ID 
	INNER JOIN Researcher r ON r.Researcher_ID = w.Researcher_ID
	INNER JOIN Researcher sv ON sv.Researcher_ID = p.Supervisor_ID
	INNER JOIN Executive ex ON ex.Executive_ID = p.Executive_ID
	INNER JOIN Researcher ev ON ev.Researcher_ID = p.Evaluator_ID
	INNER JOIN Organization o ON o.Organization_Id = p.Organization_ID
	INNER JOIN Program pr ON pr.Program_ID = p.Program_ID
	INNER JOIN Deliverable d ON d.Project_ID = p.Project_ID 
	INNER JOIN Describes descr ON descr.Project_ID = p.Project_ID
	INNER JOIN Fields field ON field.Field_type = descr.Field_type
	WHERE p.Project_ID = ${id}`;

        conn.promise().query(sqlQuery).then(([rows, project]) => {
            console.log(sqlQuery);
            res.render('info.ejs', {
                pageTitle: "Project Info",
                project: rows
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
