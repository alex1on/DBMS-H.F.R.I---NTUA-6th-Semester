const { pool } = require('../DBMS-init');

exports.getHome = (req, res, next) => {
    res.render('HomePage.ejs')
}