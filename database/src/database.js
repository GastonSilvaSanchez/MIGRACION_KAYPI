const mongoose = require('mongoose');

async function connect() {
    await mongoose.connect('mongodb+srv://RootUser:root@clusterkaypi.1nlh5.mongodb.net/Kaypi?retryWrites=true&w=majority',{
        useNewUrlParser: true
    });

    console.log('Database : connected')
};

module.exports = { connect };