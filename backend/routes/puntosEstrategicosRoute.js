const {Router} = require('express');
const {consultPuntosEstrategicos} = require('../controllers/puntosEstrategicosController');

const router = Router();

router.get('/api/puntos', consultPuntosEstrategicos);

module.exports = router;