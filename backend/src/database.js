const mongoose = require('mongoose');

async function connect(){
    try 
    {
        await mongoose.connect('mongodb+srv://RootUser:root@clusterkaypi.1nlh5.mongodb.net/kaypi?retryWrites=true&w=majority', {
            useNewUrlParser: true,
        });
        console.log('Conectado a la base de datos');
    } catch (error) 
    {
        throw new Error(error.message);
    }
}

module.exports = { connect };