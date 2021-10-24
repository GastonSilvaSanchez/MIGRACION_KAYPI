const {Schema, model} = require('mongoose');
const lineaSchema = new Schema({
    nombreLinea:String,
    categoria: String,
    telefonos:Array,
    pasajes:Array,
    horarios:Array,
    calles:Array,
    zonasBusqueda:Array,
    zonasCBBA:Array,
    rutas:Object
});

module.exports = model('lineas', lineaSchema);