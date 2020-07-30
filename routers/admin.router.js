const express = require('express');
const router = express.Router();
const restrict = require('../middlewares/auth.mdw');
const multer = require('multer');
const upload = multer({ dest: 'public/assets/images/' });
const adminModels = require('../models/admin.models');
const editoModels = require('../models/editor.models');
router.get('/', restrict, (req, res) => {
    res.render('admin/welcome', {
        layout: 'admin.hbs'
    })
})

router.get('/qlcm', restrict, (req, res) => {
    res.render('admin/qlcm', {
        layout: 'admin.hbs'
    })
})

router.get('/qln', restrict, (req, res) => {
    res.render('admin/qln', {
        layout: 'admin.hbs'
    })
})
router.get('/qlbv', restrict, async (req, res) => {

    let DSBV = await adminModels.DSALLBVPV();

    res.render('admin/articleManagement', {
        layout: 'admin.hbs',
        DSBV
    })
})
router.get('/chitiet', async (req, res) => {
    let id = req.query.id;
    let ctsp = await adminModels.chitietsp(id);
    res.render('admin/detailsPost', {
        sanpham: ctsp,
        layout: 'admin.hbs',
        isXuatBan: ctsp[0].Status == 2,
        idPost: ctsp[0].NewsID,
    })
})
router.post('/confirm', async (req, res) => {
    let idPost = req.body.idPost;
    await editoModels.updatePostD(2, idPost);
    res.redirect(`/admin/chitiet/?id=${idPost}`);
})
router.post('/delete', async (req, res) => {

    let idPost = req.body.id;
    let entity = {
        NewsID: idPost
    }
    console.log(entity);
    await adminModels.delPost(entity);
    res.redirect('/admin/qlbv');
})
module.exports = router;