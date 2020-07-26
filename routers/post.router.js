const express = require('express');
const router = express.Router();
const postModels = require('../models/post.models');
const restrict = require('../middlewares/auth.mdw');
const multer = require('multer')
const upload = multer({ dest: 'public/assets/images/' })


router.get('/phongvien', restrict, async (req, res) => {
    const list = await postModels.DSBVPV(res.locals.lcAuthUser.UserID);
    let listCM = await postModels.ListCM();
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
        listCM,
        idUser: res.locals.lcAuthUser.UserID
    });

})
router.post('/phongvien', upload.single('Avartar'), async (req, res) => {
    let countTagID = await postModels.countTag();


    if (req.body.loaiBaiViet == "Mất phí") {
        req.body.loaiBaiViet = 1;
    } else {
        req.body.loaiBaiViet = 0;
    }

    let chuyemuc = req.body.chuyemuc;
    if (chuyemuc == "Tư Liệu") {
        req.body.chuyemuc = 1;
    }
    else if (chuyemuc == "Phân Tích") {
        req.body.chuyemuc = 2;
    }
    else if (chuyemuc == "Doanh Nghiệp") {
        req.body.chuyemuc = 3;
    }
    else if (chuyemuc == "Bất Động Sản") {
        req.body.chuyemuc = 4;
    }
    else if (chuyemuc == "Phim") {
        req.body.chuyemuc = 5;
    }
    else if (chuyemuc == "Ca Nhạc") {
        req.body.chuyemuc = 6;
    }
    else if (chuyemuc == "Bóng Đá") {
        req.body.chuyemuc = 7;
    }
    else if (chuyemuc == "Tennis") {
        req.body.chuyemuc = 8;
    }
    else if (chuyemuc == "Hồ Sơ Phá An") {
        req.body.chuyemuc = 9;
    }
    else if (chuyemuc == "Tư Vấn Pháp Luật") {
        req.body.chuyemuc = 10;
    }
    else if (chuyemuc == "Tuyển Sinh") {
        req.body.chuyemuc = 11;
    }
    else if (chuyemuc == "Du Học") {
        req.body.chuyemuc = 12;
    }
    else if (chuyemuc == "Các Bệnh") {
        req.body.chuyemuc = 13;
    }
    else if (chuyemuc == "Tư Vấn Sức Khỏe") {
        req.body.chuyemuc = 14;
    }
    else if (chuyemuc == "Tổ ấm") {
        req.body.chuyemuc = 15;
    }
    else if (chuyemuc == "Bài Học Sống") {
        req.body.chuyemuc = 16;
    }
    else if (chuyemuc == "Điểm Đến") {
        req.body.chuyemuc = 17;
    }
    else if (chuyemuc == "Tư Vấn Du Lịch") {
        req.body.chuyemuc = 18;
    }
    else if (chuyemuc == "Giao Thông") {
        req.body.chuyemuc = 19;
    }
    else if (chuyemuc == "MeKong") {
        req.body.chuyemuc = 20;
    }
    let countT = countTagID.ToTal++;
    let entity = {
        NewsTitle: req.body.NewsTitle,
        Abstract: req.body.Abstract,
        Content: req.body.Content,
        IsPremium: req.body.loaiBaiViet,
        Author: +req.body.tacgia,
        DatePost: req.body.ngaydang,
        Avatar: req.file.filename,
        Status: 4,
        CatChild_ID: req.body.chuyemuc,
        TagID: countT,
    }
    await postModels.NewPost(entity);

    let countPost = await postModels.countPost();

    let entityTag = {
        TagName: req.body.TagName,
        NewsID: countPost.ToTal,
    }
    await postModels.addTag(entityTag);
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
        if (post[i].CatChild_ID == 1) {
            post[i].CatChild_ID = "Tư Liệu"
        }
        if (post[i].CatChild_ID == 2) {
            post[i].CatChild_ID = "Phân Tích"
        }
        if (post[i].CatChild_ID == 3) {
            post[i].CatChild_ID = "Doanh Nghiệp"
        }
        if (post[i].CatChild_ID == 4) {
            post[i].CatChild_ID = "Bất Động Sản"
        }
        if (post[i].CatChild_ID == 5) {
            post[i].CatChild_ID = "Phim"
        }
        if (post[i].CatChild_ID == 6) {
            post[i].CatChild_ID = "Ca Nhạc"
        }
        if (post[i].CatChild_ID == 7) {
            post[i].CatChild_ID = "Bóng Đá"
        }
        if (post[i].CatChild_ID == 8) {
            post[i].CatChild_ID = "Tennis"
        }
        if (post[i].CatChild_ID == 9) {
            post[i].CatChild_ID = "Hồ Sơ Phá An"
        }
        if (post[i].CatChild_ID == 10) {
            post[i].CatChild_ID = "Tư Vấn Pháp Luật"
        }
        if (post[i].CatChild_ID == 11) {
            post[i].CatChild_ID = "Tuyển Sinh"
        }
        if (post[i].CatChild_ID == 12) {
            post[i].CatChild_ID = "Du Học"
        }
        if (post[i].CatChild_ID == 13) {
            post[i].CatChild_ID = "Các Bệnh"
        }
        if (post[i].CatChild_ID == 14) {
            post[i].CatChild_ID = "Tư Vấn Sức Khỏe"
        }
        if (post[i].CatChild_ID == 15) {
            post[i].CatChild_ID = "Tổ ấm"
        }
        if (post[i].CatChild_ID == 16) {
            post[i].CatChild_ID = "Bài Học Sống"
        }
        if (post[i].CatChild_ID == 17) {
            post[i].CatChild_ID = "Điểm Đến"
        }
        if (post[i].CatChild_ID == 18) {
            post[i].CatChild_ID = "Tư Vấn Du Lịch"
        }
        if (post[i].CatChild_ID == 19) {
            post[i].CatChild_ID = "Giao Thông"
        }
        if (post[i].CatChild_ID == 20) {
            post[i].CatChild_ID = "MeKong"
        }

    }

    res.render('post/editPost', {
        post: post[0],
        note: post[0].Note != null

    });
})
router.post('/edit', upload.single('Avartar'), async (req, res) => {

    let post = await postModels.selectPost(req.body.NewsID);
    let idpost = req.body.NewsID;
    let chuyemucPost = req.body.showchuyenmuc;
    let chuyemuc = req.body.chuyemuc;

    if (chuyemuc == "Tư Liệu") {
        req.body.chuyemuc = 1;
    }
    else if (chuyemuc == "Phân Tích") {
        req.body.chuyemuc = 2;
    } else if (chuyemuc == "Thay Đổi Chuyên Mục") {
        req.body.chuyemuc = 0;
    }
    else if (chuyemuc == "Doanh Nghiệp") {
        req.body.chuyemuc = 3;
    }
    else if (chuyemuc == "Bất Động Sản") {
        req.body.chuyemuc = 4;
    }
    else if (chuyemuc == "Phim") {
        req.body.chuyemuc = 5;
    }
    else if (chuyemuc == "Ca Nhạc") {
        req.body.chuyemuc = 6;
    }
    else if (chuyemuc == "Bóng Đá") {
        req.body.chuyemuc = 7;
    }
    else if (chuyemuc == "Tennis") {
        req.body.chuyemuc = 8;
    }
    else if (chuyemuc == "Hồ Sơ Phá An") {
        req.body.chuyemuc = 9;
    }
    else if (chuyemuc == "Tư Vấn Pháp Luật") {
        req.body.chuyemuc = 10;
    }
    else if (chuyemuc == "Tuyển Sinh") {
        req.body.chuyemuc = 11;
    }
    else if (chuyemuc == "Du Học") {
        req.body.chuyemuc = 12;
    }
    else if (chuyemuc == "Các Bệnh") {
        req.body.chuyemuc = 13;
    }
    else if (chuyemuc == "Tư Vấn Sức Khỏe") {
        req.body.chuyemuc = 14;
    }
    else if (chuyemuc == "Tổ ấm") {
        req.body.chuyemuc = 15;
    }
    else if (chuyemuc == "Bài Học Sống") {
        req.body.chuyemuc = 16;
    }
    else if (chuyemuc == "Điểm Đến") {
        req.body.chuyemuc = 17;
    }
    else if (chuyemuc == "Tư Vấn Du Lịch") {
        req.body.chuyemuc = 18;
    }
    else if (chuyemuc == "Giao Thông") {
        req.body.chuyemuc = 19;
    }
    else if (chuyemuc == "MeKong") {
        req.body.chuyemuc = 20;
    }
    if (req.file) {
        if (req.body.loaiBaiViet == "Mất phí") {
            req.body.loaiBaiViet = 1;
        } else {
            req.body.loaiBaiViet = 0;
        }
        if (chuyemucPost != req.body.chuyemuc && req.body.chuyemuc != 0) {
            let entity = {
                NewsTitle: req.body.NewsTitle,
                Abstract: req.body.Abstract,
                Content: req.body.Content,
                IsPremium: req.body.loaiBaiViet,
                Author: +req.body.tacgia,
                DatePost: req.body.ngaydang,
                Avatar: req.file.filename,
                Status: 4,
                Note: null,
                CatChild_ID: req.body.chuyemuc
            }

            await postModels.updatePost(entity, idpost);
            res.redirect('/post/phongvien');
        } else {
            let entity = {
                NewsTitle: req.body.NewsTitle,
                Abstract: req.body.Abstract,
                Content: req.body.Content,
                IsPremium: req.body.loaiBaiViet,
                Author: +req.body.tacgia,
                DatePost: req.body.ngaydang,
                Avatar: req.file.filename,
                Status: 4,
                Note: null,
            }

            await postModels.updatePost(entity, idpost);
            res.redirect('/post/phongvien');
        }

    } else {
        if (req.body.loaiBaiViet == "Mất phí") {
            req.body.loaiBaiViet = 1;
        } else {
            req.body.loaiBaiViet = 0;
        }
        if (chuyemucPost != req.body.chuyemuc && req.body.chuyemuc != 0) {
            let entity = {
                NewsTitle: req.body.NewsTitle,
                Abstract: req.body.Abstract,
                Content: req.body.Content,
                IsPremium: req.body.loaiBaiViet,
                Author: +req.body.tacgia,
                DatePost: req.body.ngaydang,
                Avatar: post[0].Avatar,
                Status: 4,
                Note: null,
                CatChild_ID: req.body.chuyemuc
            }
            await postModels.updatePost(entity, idpost);
            res.redirect('/post/phongvien');
        } else {
            let entity = {
                NewsTitle: req.body.NewsTitle,
                Abstract: req.body.Abstract,
                Content: req.body.Content,
                IsPremium: req.body.loaiBaiViet,
                Author: +req.body.tacgia,
                DatePost: req.body.ngaydang,
                Avatar: post[0].Avatar,
                Status: 4,
                Note: null,
            }
            await postModels.updatePost(entity, idpost);
            res.redirect('/post/phongvien');
        }

    }

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

router.get('/is-dataComment', async (req, res) => {
    const comment = await postModels.selectComent(req.query.idPost);
    res.json(Array.from(comment));
})

router.get('/detailsCategory/:id', restrict, async (req, res) => {

    let id = +req.params.id;
    console.log(id);
    const row = await postModels.chitietsp(id);

    const row2 = await postModels.bvlienquan();

    res.render('post/categories', {
        sanpham: row,
        bvlienquan: row2,
        idPost: row[0].NewsID,

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

router.post('/uploadCm', async (req, res) => {


    var d = new Date();
    var n = d.toString();
    n = n.split(' ');
    let time = "";
    for (let i = 0; i < n.length; i++) {
        if (i == 0) {
            continue;
        }
        time = time + n[i] + "-";
        if (i >= 4) {
            break;
        }
    }
    time = time.slice(0, time.length - 1);
    let entity = {
        Content: req.body.ndBinhLuan,
        UserID: +res.locals.lcAuthUser.UserID,
        NewsID: +req.body.idPost,
        DateTime: time
    }
    await postModels.addCM(entity);
    let newCm = await postModels.selectComentNew(+req.body.idPost);
    return res.send(newCm);
    // res.redirect(req.headers.referer);
})


module.exports = router;