const express = require('express');
const organizationController = require('../controllers/organization');
const router = express.Router();

router.get('/', organizationController.getOrganizations);
router.post('/update/:id', organizationController.postUpdateOrganization);
router.post('/delete', organizationController.postDeleteOrganization);
router.get('/create-organization-page', organizationController.postCreatePage);
router.post('/create-organization', organizationController.postCreateOrganization);
router.get('/researchers', organizationController.getShowResearchers);
router.get('/phones', organizationController.getShowPhones);
router.post('/phones/update/:id', organizationController.postUpdatePhone);
router.post('/phones/delete', organizationController.postDeletePhone);
router.get('/phones/create-phone-page', organizationController.getCreatePhonePage);
router.post('/phones/create-phone', organizationController.postCreatePhone);
router.get('/projects', organizationController.getOrganizationProjects);


module.exports = router;