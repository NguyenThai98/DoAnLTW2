const localModels = require('../models/locals.models');

module.exports = function (app) {
    app.use(async function (req, res, next) {
        const bvnoibat = await localModels.chonBVNoiBat();  
        res.locals.lcBVnoiBat = bvnoibat;
       
        next();
    })
    app.use(async function (req, res, next) {
        const muoiBVnoibat = await localModels.chonBV10NoiBat();
        res.locals.lcmuoiBVnoibat = muoiBVnoibat;
       
        next();
    })
}