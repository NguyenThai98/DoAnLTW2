const express = require('express');
const router = express.Router();
const editoModels = require('../models/editor.models');
const restrict = require('../middlewares/auth.mdw');
router.get('/', restrict, async (req, res) => {
    let editorPer = res.locals.lcAuthUser;
    let list = await editoModels.selectPostPV(editorPer.UserID);

    for (let i = 0; i < list.length; i++) {
        if (list[i].Status == 4) {
            list[i].Status = "Chưa Được Duyệt";
        } else if (list[i].Status == 3) {
            list[i].Status = "Bị Từ Chối";
        }
        else if (list[i].Status == 2) {
            list[i].Status = "Đã Xuất Bản";
        } else {
            list[i].Status = "Đã Được Duyệt và Chờ Xuất Bản";
        }
    }
    res.render('editor/home', {
        list,
    })
})
router.get('/details/:id', restrict, async (req, res) => {
    let id = req.params.id;
    let detailsPost = await editoModels.detailsPost(id);

    res.render('editor/details', {
        detailsPost
    });
})
router.post('/confirm', async (req, res) => {
    let idPost = req.body.NewsID;
    await editoModels.updatePost(2, idPost);
    res.redirect('/editor');
})
router.post('/cancel', async (req, res) => {
    let idPost = req.body.NewsID;
    let msgCancel = req.body.cancelPost;
    let entity = {
        Status: 3,
        Note: msgCancel
    }
    await editoModels.updatePost(entity, idPost);
    res.redirect('/editor');
})
module.exports = router;