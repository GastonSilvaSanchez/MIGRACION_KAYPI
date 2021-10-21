const mongoose = require('mongoose');

const dbConnection = async() => {

    try {
        console.log('Conecting DB...');
        await mongoose.connect('mongodb+srv://kaypiAdmin:kaypiAdmin123@clusterkaypi.1nlh5.mongodb.net/kaypi',{
            useNewUrlParser: true
        });
        console.log('Conectado......:D');
    }
    catch (error) {
        throw new Error(error);
    }

}

module.exports = { dbConnection }