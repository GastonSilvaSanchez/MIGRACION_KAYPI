const { Schema, model } = require('mongoose');

const lugarSchema = new Schema({
    titulo: String,
    portada: String, 
    categoria: String, 
    informacion: Array, 
    imagenes: Array, 
    ubicacion: Object, 
    sitioWeb: String


});

module.exports = model('lugaresTuristicos', lugarSchema);
