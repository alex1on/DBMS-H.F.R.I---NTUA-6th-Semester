const express = require('express');
const projectController = require('../controllers/project');
const router = express.Router();

router.get('/', projectController.getProjects);
router.get('/deliverables', projectController.getDeliverableInfo);
router.post('/deliverables/delete', projectController.postDeleteDeliverable);
router.post('/deliverables/update/:id', projectController.postUpdateDeliverable);
router.get('/deliverables/create-deliverable-page', projectController.getCreateDeliverablePage);
router.post('/deliverables/create-deliverable', projectController.postCreateDeliverable);
router.post('/update/:id', projectController.postUpdateProject);
router.post('/delete', projectController.postDeleteProject);
router.get('/create-project-page', projectController.postCreatePage);
router.post('/create-project', projectController.postCreateProject);
router.get('/researchers', projectController.getShowResearchers);
router.get('/fields', projectController.getShowFields);
router.get('/filter', projectController.getFilters);
router.post('/filtered', projectController.getFilteredProjects);


module.exports = router;