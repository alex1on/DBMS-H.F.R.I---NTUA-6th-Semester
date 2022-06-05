const express = require('express');
const fieldsController = require('../controllers/fields');
const router = express.Router();

router.get('/', fieldsController.getFields);
router.post('/update/:id', fieldsController.postUpdateField);
router.post('/delete', fieldsController.postDeleteField);
router.get('/create-field-page', fieldsController.postCreatePage);
router.post('/create-field', fieldsController.postCreateField);
router.get('/projects', fieldsController.getFieldProjects);

module.exports = router;