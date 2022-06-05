const express = require('express');
const query3Controller = require('../controllers/query3');
const router = express.Router();

router.post('/', query3Controller.getQuery3);

module.exports = router;