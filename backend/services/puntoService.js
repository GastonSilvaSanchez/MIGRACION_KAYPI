const puntosModel = require('../models/puntosModel');

class PuntosService {

    PuntosService(){}

    async getPuntos() {
        try {
            return await puntosModel.find();
        }
        catch(error){
            throw new Error(error);
        }
    }
}

module.exports = new PuntosService();