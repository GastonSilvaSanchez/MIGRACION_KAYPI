const mongoose = require('mongoose');


const url = 'mongodb://localhost/kaypi';

mongoose.connect(url, {

})
.then(() => console.log('CONECTADO A LA BASE DE DATOS'))
.catch((e) => console.log('ERROR: ' + e.message))
