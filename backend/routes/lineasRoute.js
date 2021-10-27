const {Router} = require('express');
const {consultLineas} = require('../controllers/lineasController');

const router = Router();

router.get('/api/lineas', consultLineas);

module.exports = router;