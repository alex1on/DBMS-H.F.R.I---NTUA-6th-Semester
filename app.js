const express = require('express');
const path = require('path');
const session = require('express-session');
const flash = require('connect-flash');

//require('custom-env').env('localhost');

const home = require('./routes/home');
const fields = require('./routes/fields');
const researcher = require('./routes/researcher');
const project = require('./routes/project');
const organization = require('./routes/organization');
const executive = require('./routes/executive');
const program = require('./routes/program');
const query3 = require('./routes/query3');
const query4 = require('./routes/query4');
const query5 = require('./routes/query5');
const query6 = require('./routes/query6');
const query7 = require('./routes/query7');
const query8 = require('./routes/query8');

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public')));
app.set('view engine', 'ejs');
app.set('views', 'views');
app.use(flash());

// Routes TBC !
app.use(session({
    secret: "ThisShouldBeSecret",
    resave: false,
    saveUninitialized: false
}))


app.use('/', home);
app.use('/fields', fields);
app.use('/researcher', researcher);
app.use('/project', project);
app.use('/organization', organization);
app.use('/executive', executive);
app.use('/program', program);
app.use('/query3', query3);
app.use('/query4', query4);
app.use('/query5', query5);
app.use('/query6', query6);
app.use('/query7', query7);
app.use('/query8', query8);

app.use((req, res, next) => { res.status(404).render('404.ejs', { pageTitle: '404' }) });

module.exports = app;