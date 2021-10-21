const puntosEstrategicosModel = require('../models/puntosEstrategicosModel');

class PuntosEstrategicosService {

    PuntosEstrategicosService(){}

    async getPuntosEstrategicos() {
        try {
            return await puntosEstrategicosModel.find();
        }
        catch(error){
            throw new Error(error);
        }
    }
}

module.exports = new PuntosEstrategicosService();