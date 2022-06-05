const express = require('express');
const query5Controller = require('../controllers/query5');
const router = express.Router();

router.get('/', query5Controller.getQuery5);

module.exports = router;