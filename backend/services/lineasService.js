const lineasModel = require('../models/lineasModel');

class LineasService {

    LineasService(){}

    async getLineas() {
        try {
            return await lineasModel.find();
        }
        catch(error){
            throw new Error(error);
        }
    }
}

module.exports = new LineasService();