const express = require('express');
const organizationController = require('../controllers/organization');
const router = express.Router();

router.get('/', organizationController.getOrganizations);

module.exports = router;