const express = require('express');
const programController = require('../controllers/program');
const router = express.Router();

router.get('/', programController.getPrograms);
router.post('/update/:id', programController.postUpdateProgram);
router.post('/delete', programController.postDeleteProgram);
router.get('/create-program-page', programController.postCreatePage);
router.post('/create-program', programController.postCreateProgram);

module.exports = router;