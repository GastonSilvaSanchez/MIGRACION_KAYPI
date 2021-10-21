const {Router} = require('express');
const {consultPuntos} = require('../controllers/puntoController');

const router = Router();

router.get('/api/puntos', consultPuntos);

module.exports = router;