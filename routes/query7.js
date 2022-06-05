const express = require('express');
const query7Controller = require('../controllers/query7');
const router = express.Router();

router.get('/', query7Controller.getQuery7);

module.exports = router;