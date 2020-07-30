const express = require('express');
const router = express.Router();
const restrict = require('../middlewares/auth.mdw');

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


router.get('/qluser', restrict, async (req, res) => {

    let DSUSER = await adminModels.DSUSER();
    res.render('admin/qluser', {
        layout: 'admin.hbs',
        DSUSER
    })
})

router.get('/chitietuser', restrict, async (req, res) => {

    let id = req.query.id;

    let chitietUser = await adminModels.chitietUser(id);

    console.log(chitietUser);

    if (chitietUser[0].TypeOfUser == 0) {
        chitietUser[0].TypeOfUser = "Độc Giả";
    } else if (chitietUser[0].TypeOfUser == 2) {
        chitietUser[0].TypeOfUser = "Phóng Viên";

    } else if (chitietUser[0].TypeOfUser == 3) {
        chitietUser[0].TypeOfUser = "Biên Tập Viên";
    } else if (chitietUser[0].TypeOfUser == -1) {
        chitietUser[0].TypeOfUser = "Khách";
    }
    res.render('admin/detailsUser', {
        chitietUser
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
router.post('/updateTypeUser', async (req, res) => {
    let id = req.body.idUser;
    await adminModels.updateTypeUser(req.body.typeUser, id);
    res.redirect(`/admin/chitietuser/?id=${id}`);
})
module.exports = router;