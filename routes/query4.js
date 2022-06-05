const express = require('express');
const query4Controller = require('../controllers/query4');
const router = express.Router();

router.get('/', query4Controller.getQuery4);

module.exports = router;