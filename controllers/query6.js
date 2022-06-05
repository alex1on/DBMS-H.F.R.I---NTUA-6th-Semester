const { pool } = require('../DBMS-init');

/* Controller to retrieve Query 6 from database */
exports.getQuery6 = (req, res, next) => {

    /* check for messages in order to show them when rendering the page */
    let messages = req.flash("messages");
    if (messages.length == 0) messages = [];

    /* create the connection, execute query, render data */
    pool.getConnection((err, conn) => {

        conn.promise().query('SELECT * FROM Query_6')
            .then(([rows, fields]) => {
                res.render('query6.ejs', {
                    pageTitle: "Query 6 Page",
                    researcher: rows,
                    messages: messages
                })
            })
            .then(() => pool.releaseConnection(conn))
            .catch(err => console.log(err))
    })
}
