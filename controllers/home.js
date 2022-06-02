const { pool } = require('../DBMS-init');

exports.getHome = (req, res, next) => {
    /*
    const { readFile } = require('fs');
    readFile('./testWeb.html', 'utf8', (err, html) => {
        if (err) {
            response.status(500).send('sorry, out of order')
        }
        response.send(html);
    }) */
    res.render('HomePage.ejs')
}