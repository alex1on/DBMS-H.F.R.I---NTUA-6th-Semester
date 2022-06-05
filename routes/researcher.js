const express = require('express');
const researcherController = require('../controllers/researcher');
const router = express.Router();

router.get('/', researcherController.getResearchers);
router.post('/update/:id', researcherController.postUpdateResearcher);
router.post('/delete', researcherController.postDeleteResearcher);
router.get('/create-researcher-page', researcherController.postCreatePage);
router.post('/create-researcher', researcherController.postCreateResearcher);

module.exports = router;
