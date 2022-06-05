const { pool } = require('../DBMS-init');

exports.getHome = (req, res, next) => {
    res.render('HomePage.ejs')
}

exports.getField = (req, res, next) => {
    res.render('field_choose.ejs', {
        pageTitle: "Choose field"
    })
}