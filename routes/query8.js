const express = require('express');
const query8Controller = require('../controllers/query8');
const router = express.Router();

router.get('/', query8Controller.getQuery8);

module.exports = router;