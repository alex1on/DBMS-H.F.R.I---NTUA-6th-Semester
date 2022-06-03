const express = require('express');
const programController = require('../controllers/program');
const router = express.Router();

router.get('/', programController.getPrograms);

module.exports = router;