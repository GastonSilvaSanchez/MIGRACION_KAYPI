const { Router } = require('express');
const router = Router();

const LugarTuristico = require('../models/LugarTuristico');


router.get('/api/lugaresTuristicos',async (req, res) => {
    const lugaresTuristicos = await LugarTuristico.find();
    res.json({lugaresTuristicos});
});


module.exports = router;