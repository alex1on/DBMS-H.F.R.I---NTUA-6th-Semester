const { pool } = require('../DBMS-init');

/* Controller to retrieve Query 3 from database */
exports.getQuery3 = (req, res, next) => {
    const field = req.body.field_type;

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {

        var sqlQuery = `SELECT p.Project_ID, p.Title, r.Researcher_ID, r.First_Name, r.Last_Name, f.Field_type FROM fields f INNER JOIN Describes d ON f.Field_type = d.Field_type INNER JOIN Project p ON d.Project_ID = p.Project_ID INNER JOIN Works_On w ON p.Project_ID = w.Project_ID INNER JOIN Researcher r ON w.Researcher_ID = r.Researcher_ID WHERE f.Field_type = '${field}' AND w.Active = 1 AND p.Active = 1`;
        conn.promise().query(sqlQuery)
            .then(([rows, fields]) => {
                res.render('query3.ejs', {
                    pageTitle: "Query 3 Page",
                    researcher: rows,
                    messages: messages
                })
            })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
    })
}
