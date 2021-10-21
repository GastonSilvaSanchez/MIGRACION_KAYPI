const puntosService = require('../services/puntoService');

const consultPuntos = async (req, res) => {
    res.json({
        puntos: await puntosService.getPuntos()
    });
}

module.exports = {consultPuntos};