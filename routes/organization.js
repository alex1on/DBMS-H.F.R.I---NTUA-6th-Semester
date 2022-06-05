const express = require('express');
const organizationController = require('../controllers/organization');
const router = express.Router();

router.get('/', organizationController.getOrganizations);
router.post('/update/:id', organizationController.postUpdateOrganization);
router.post('/delete', organizationController.postDeleteOrganization);
router.get('/create-organization-page', organizationController.postCreatePage);
router.post('/create-organization', organizationController.postCreateOrganization);

module.exports = router;