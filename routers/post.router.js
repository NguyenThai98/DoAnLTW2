const express = require('express');
const router = express.Router();
const postModels = require('../models/post.models');
const restrict = require('../middlewares/auth.mdw');
const multer = require('multer')
const upload = multer({ dest: 'public/assets/images/' })


router.get('/phongvien', restrict, async (req, res) => {
    const list = await postModels.DSBVPV(res.locals.lcAuthUser.UserID);
    for (let i = 0; i < list.length; i++) {
        if (list[i].Status == 4) {
            list[i].Status = "Chưa Được Duyệt";
            list[i].isDel = true;
        } else if (list[i].Status == 3) {
            list[i].Status = "Bị Từ Chối";
            list[i].isDel = true;
        } else if (list[i].Status == 2) {
            list[i].Status = "Đã Xuất Bản"
        } else {
            list[i].Status = "Đã Được Duyệt và Chờ Xuất Bản"
        }
    }


    res.render('post/reporter', {
        list,
        idUser: res.locals.lcAuthUser.UserID
    });

})
router.post('/phongvien', upload.single('Avartar'), async (req, res) => {
    if (req.body.loaiBaiViet == "Mất phí") {
        req.body.loaiBaiViet = 1;
    } else {
        req.body.loaiBaiViet = 0;
    }
    let entity = {
        NewsTitle: req.body.NewsTitle,
        Abstract: req.body.Abstract,
        Content: req.body.Content,
        IsPremium: req.body.loaiBaiViet,
        Author: +req.body.tacgia,
        DatePost: req.body.ngaydang,
        Avatar: req.file.filename,
        Status: 4
    }
    await postModels.NewPost(entity);

    res.redirect('/post/phongvien');

})
router.get('/listCategories/:id', restrict, async (req, res) => {
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
    let listIsPremium = [];
    let listNotPremium = [];
    for (let i = 0; i < row.length; i++) {
        const item = {
            CatName: row[i].CatName,
        }
        catName.push(item);
        break;
    }
    for (let i = 0; i < row.length; i++) {
        if (row[i].IsPremium == 1) {
            listIsPremium.push(row[i]);
        } else {
            listNotPremium.push(row[i]);
        }
    }
    let typeUser = req.session.authUser.TypeOfUser;


    res.render('post/listCategoriesParent', {
        listIsPremium,
        listNotPremium,
        list: row,
        empty: row.length == 0,
        catName,
        typeUser: typeUser == 0,
        pages_item,
        next: +page + 1,
        prev: +page - 1,
        can_go_prev: page <= 1,
        can_go_next: page >= nTrang,
    });
})
router.get('/edit/:idNews', restrict, async (req, res) => {
    let idPost = req.params.idNews;

    let post = await postModels.selectEditPost(idPost);

    for (let i = 0; i < post.length; i++) {
        if (post[i].IsPremium == 1) {
            post[i].IsPremium = true;
        } else {
            post[i].IsPremium = false;
        }
    }

    res.render('post/editPost', {
        post
    });
})
router.get('/listChild/:id', restrict, async (req, res) => {
    let id = req.params.id;
    const limit = 1;
    let page = req.query.page || 1;
    if (page < 0) {
        page = 1;
    }
    let offset = (page - 1) * limit;
    const row = await postModels.trangSanphamCon(id, limit, offset);
    const tongTrang = await postModels.tongtrangCon(id);

    const nTrang = Math.ceil(tongTrang / limit);
    let pages_item = [];
    for (let i = 1; i <= nTrang; i++) {
        const item = {
            value: i,
            isActive: i == page
        }
        pages_item.push(item);
    }
    let CatChildName = [];
    for (let i = 0; i < row.length; i++) {
        const item = {
            CatChildName: row[i].CatChildName,
        }
        CatChildName.push(item);
        break;
    }
    res.render('post/listCategories', {
        list: row,
        CatChildName,
        pages_item,
        next: +page + 1,
        prev: +page - 1,
        can_go_prev: page <= 1,
        can_go_next: page >= nTrang,
    });
})
router.get('/listTag', restrict, async (req, res) => {
    const nameTag = req.query.tagName;
    const row = await postModels.listTag(nameTag);
    let TagName = [];
    for (let i = 0; i < row.length; i++) {
        const item = {
            TagName: row[i].TagName,
        }
        TagName.push(item);
        break;
    }
    res.render('post/listTag', {
        list: row,
        TagName,
    });
})
router.get('/detailsCategory/:id', restrict, async (req, res) => {
    const id = +req.params.id;
    const row = await postModels.chitietsp(id);
    const row2 = await postModels.bvlienquan();
    res.render('post/categories', {
        sanpham: row,
        bvlienquan: row2
    })

})
router.post('/search', async (req, res) => {
    let search = req.body.search;
    const row = await postModels.searchPost(search);
    res.render('post/listSearch', {
        list: row,
        empty: row.length == 0,
    })
})
//post/category
module.exports = router;