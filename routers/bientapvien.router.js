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
router.get('/details/:id', async (req, res) => {
    let id = req.params.id;


    let detailsPost = await editoModels.detailsPost(id);
    console.log(detailsPost);
    res.render('editor/details', {
        detailsPost
    });
})
module.exports = router;