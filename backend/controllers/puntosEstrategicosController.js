const puntosEstrategicosService = require('../services/puntosEstrategicosService');

const consultPuntosEstrategicos = async (req, res) => {
    res.json({
        puntosEstrategicos: await puntosEstrategicosService.getPuntosEstrategicos()
    });
}

module.exports = {consultPuntosEstrategicos};