const express = require('express');
const query6Controller = require('../controllers/query6');
const router = express.Router();

router.get('/', query6Controller.getQuery6);

module.exports = router;