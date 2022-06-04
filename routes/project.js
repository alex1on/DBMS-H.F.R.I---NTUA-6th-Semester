const express = require('express');
const projectController = require('../controllers/project');
const router = express.Router();

router.get('/', projectController.getProjects);
router.get('/info', projectController.getProjectInfo);
router.post('/delete', projectController.postDeleteProject);

module.exports = router;