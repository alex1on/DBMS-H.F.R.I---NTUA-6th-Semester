const express = require('express');
const executiveController = require('../controllers/executive');
const router = express.Router();

router.get('/', executiveController.getExecutives);
router.post('/update/:id', executiveController.postUpdateExecutive);
router.post('/delete', executiveController.postDeleteExecutive);
router.get('/create-executive-page', executiveController.postCreatePage);
router.post('/create-executive', executiveController.postCreateExecutive);

module.exports = router;