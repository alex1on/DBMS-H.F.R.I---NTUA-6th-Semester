const express = require('express');
const homeController = require('../controllers/home');
const router = express.Router();

router.get('/', homeController.getHome);
router.get('/choose-field', homeController.getField);

module.exports = router;