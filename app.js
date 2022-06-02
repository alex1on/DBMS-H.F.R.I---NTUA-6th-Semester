const express = require('express');
const path = require('path');
const session = require('express-session');
const flash = require('connect-flash');

//require('custom-env').env('localhost');

const home = require('./routes/home');
const fields = require('./routes/fields');
const researcher = require('./routes/researcher');

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public')));
app.set('view engine', 'ejs');
app.set('views', 'views');
app.use(flash());

// Routes TBC !

app.use('/', home);
app.use('/fields', fields);
app.use('/researcher', researcher);

app.use((req, res, next) => { res.status(404).render('404.ejs', { pageTitle: '404'}) });

module.exports = app;