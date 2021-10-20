const {Router} = require('express');
const router = Router();

const lugar = require('../models/lugar');
const faker = require('faker');

/*router.get('/api/LugaresTuristicos', (req, res) => {
    res.json('Lista de lugares');
});*/

router.get('/api/lugares', async (req, res) => {
    const lugares = await lugar.find();
    res.json({lugares});
});

router.get('/api/lugares/create', async (req, res) => {
    for (let i = 0; i < 1; i++) {
        await lugar.create({
            titulo: "Catedral Metropolitana",
            portada: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/ad/8d/ce/catedrale-metropolitana.jpg?w=1200&h=-1&s=1",
            categoria: "Iglesias y Catedrales",
            informacion:[ 
                          "Geográficamente la Catedral Metropolitana de San Sebastián de Cochabamba, tiene un lugar privilegiado",
                          "La iglesia fue reedificada en dos ocasiones: 1619 y 1701, definiéndose la forma que actualmente tiene.",
                          "En 1830 se añadieron las naves laterales y en 1925 se incorporó la galería que da a la Iglesia.",
                          "Fue nombrada metropolitana en 1975"
                        ],
            imagenes:[ 
                        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/06/fa/d5/f1/catedral-de-san-sebastian.jpg?w=1200&h=-1&s=1",
                        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/ad/8c/fe/altar-und-kanzel.jpg?w=1200&h=-1&s=1",
                        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/18/ad/8d/6b/deckenmalerei.jpg?w=1200&h=-1&s=1"
                     ],
            ubicacion: [faker.address.latitude(), faker.address.longitude()],
            sitioWeb: "https://cochabambabolivia.net/atractivos/catedral-metropolitana/"
        })

        /*await lugar.create({
            titulo: "Palacio Portales",
            portada: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0d/6c/0c/d7/photo0jpg.jpg?w=1200&h=-1&s=1",
            categoria: "Museos",
            informacion:[ 
                          "Ubicado en la zona Queru Queru, el Palacio Portales fue construido entre 1915 y 1927",
                          "El arquitecto francés Eugène Bliault diseñó el proyecto del Palacio, y fue ejecutado empleando mano de obra artesanal y utilizando materiales de construcción traídos de Europa",
                          "El Palacio es un ejemplo de estilo ecléctico, que respondía a comienzos del Siglo XX al gusto de las élites europeas.",
                          "Sus jardines fueron diseñados por expertos japoneses"
                        ],
            imagenes:[ 
                        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/dd/15/3d/20160906-180918-largejpg.jpg?w=1200&h=-1&s=1",
                        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0c/6e/04/89/img-20160807-wa0017-largejpg.jpg?w=1200&h=-1&s=1",
                        "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0d/6c/0c/dc/photo5jpg.jpg?w=1200&h=-1&s=1"
                     ],
            ubicacion: ["-17.37483521862583", "-66.15294463496637"],
            sitioWeb: "https://centropatino.fundacionpatino.org/areas/palacio-portales/"
        })*/

    }
    res.json({message: 'Se agrego un nuevo registro'});
});

module.exports = router;