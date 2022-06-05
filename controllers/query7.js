const { pool } = require('../DBMS-init');

/* Controller to retrieve Query 7 from database */
exports.getQuery7 = (req, res, next) => {

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {

        conn.promise().query('SELECT * FROM Query_7')
            .then(([rows, fields]) => {
                res.render('query7.ejs', {
                    pageTitle: "Query 7 Page",
                    researcher: rows,
                    messages: messages
                })
            })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
    })
}
