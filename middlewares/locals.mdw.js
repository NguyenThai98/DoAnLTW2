const LRU = require("lru-cache");
const localModels = require('../models/locals.models');

const cache = new LRU({
    max: 500,
    maxAge: 100 * 60,
})

module.exports = function (app) {
    app.use(async function (req, res, next) {
        const data = cache.get('bvnoibat');
        if (!data) {
            console.log('lay data tu db');
            const bvnoibat = await localModels.chonBVNoiBat();
            res.locals.lcBVnoiBat = bvnoibat;
            cache.set('bvnoibat', bvnoibat)
        } else {
            console.log('lay data tu cache');
            res.locals.lcBVnoiBat = data;
        }
        next();
    })
    app.use(async function (req, res, next) {
        const data = cache.get('muoiBVnoibat');
        if (!data) {
            const muoiBVnoibat = await localModels.chonBV10NoiBat();
            res.locals.lcmuoiBVnoibat = muoiBVnoibat;
            cache.set('muoiBVnoibat', muoiBVnoibat)
        } else {
            res.locals.lcmuoiBVnoibat = data;
        }
        next();
    })
    app.use(async function (req, res, next) {

        const data = cache.get('BVmoinhat');
        if (!data) {
            const BVmoinhat = await localModels.BVmoiNhat();
            res.locals.lcBVmoiNhat = BVmoinhat;
            cache.set('BVmoinhat', BVmoinhat)
        } else {
            res.locals.lcBVmoiNhat = data;
        }
        next();
    })
    app.use(async function (req, res, next) {
        const data = cache.get('muoichuyenmuc');
        if (!data) {
            const muoichuyenmuc = await localModels.muoichuyenmuc();
            res.locals.lcmuoichuyenmuc = muoichuyenmuc;
            cache.set('muoichuyenmuc', muoichuyenmuc);
        } else {
            res.locals.lcmuoichuyenmuc = data;
        }
        next();
    })
}