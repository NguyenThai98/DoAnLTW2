const express = require('express');
const router = express.Router();
const postModels = require('../models/post.models');
router.get('/reporter', (req, res) => {
    res.render('post/reporter');
})
router.get('/listCategories/:id', async (req, res) => {
    let id = req.params.id;
    const limit = 2;

    let page = req.query.page || 1;
    if (page < 0) {
        page = 1;
    }
    let offset = (page - 1) * limit;
    const row = await postModels.trangSanpham(id, limit, offset);
    const tongTrang = await postModels.tongtrang(id);

    const nTrang = Math.ceil(tongTrang / limit);
    let pages_item = [];
    for (let i = 1; i <= nTrang; i++) {
        const item = {
            value: i,
            isActive: i == page
        }
        pages_item.push(item);
    }
    let catName = [];
    for (let i = 0; i < row.length; i++) {
        const item = {
            CatName: row[i].CatName,
        }
        catName.push(item);
        break;
    }
    res.render('post/listCategories', {
        list: row,
        catName,
        pages_item,
        next: +page + 1,
        prev: +page - 1,
        can_go_prev: page <= 1,
        can_go_next: page >= nTrang,
    });
})
router.get('/edit', (req, res) => {
    res.render('post/editPost');
})


router.get('/detailsCategory/:id', async (req, res) => {
    const id = +req.params.id;
    const row = await postModels.chitietsp(id);
    const row2 = await postModels.bvlienquan();
    res.render('post/categories', {
        sanpham: row,
        bvlienquan: row2
    })

})
//post/category
module.exports = router;