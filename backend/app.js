const express = require('express');

const app = express();

app.use(express.urlencoded({extended: true}));
app.use(express.json());

app.use(require('./routes/lineasRoute'));
app.use(require('./routes/puntosEstrategicosRoute'));

module.exports = app;