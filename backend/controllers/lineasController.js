const lineasService = require('../services/lineasService');

const consultLineas = async (req, res) => {
    res.json({
        lineas: await lineasService.getLineas()
    });
}

module.exports = {consultLineas};