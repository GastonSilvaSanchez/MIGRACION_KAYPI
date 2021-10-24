const {Schema, model} = require('mongoose');
const puntoSchema = new Schema({
    nombre:String,
    categoria: String,
    calles:Array,
    imagen:String,
    zonasCBBA:String,
    lineas:Array,
    descripcion:String,
    punto:Object,
    marcador:String
});

module.exports = model('punto', puntoSchema);