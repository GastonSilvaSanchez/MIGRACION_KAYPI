const express = require('express');

const app = express();

app.use(express.urlencoded({extended: true}));
app.use(express.json());

app.use(require('./routes/puntoRoute'));

module.exports = app;