const express = require('express');
const fieldsController = require('../controllers/fields');
const router = express.Router();

router.get('/', fieldsController.getFields);

module.exports = router;