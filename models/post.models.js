const db = require('../utils/db');
const TBL_NEWS = 'news';

module.exports = {
    all: function () {
        return db.load(`select * from ${TBL_USERS}`);
    },
    chitietsp: function (id) {
        return db.load(`SELECT n.Avatar, n.NewsID,n.NewsTitle,t.TagName,n.Content,c.CatName,n.DatePost FROM news n JOIN category_child cc on n.CatChild_ID = cc.CatChild_ID JOIN category c on c.CatID = cc.CatID join tag t on t.TagID = n.TagID  WHERE n.Status = 2 AND n.NewsID = ${id}`);
    },
    bvlienquan: function () {
        return db.load(`SELECT n.Avatar, n.NewsID,n.NewsTitle,n.DatePost,t.TagName FROM news n join tag t on n.TagID = t.TagID ORDER BY RAND() LIMIT 5 `);
    },
    trangSanpham: function (id, limit, offset) {
        return db.load(`SELECT n.IsPremium, c.CatID, n.Abstract, n.NewsID, n.Avatar,n.NewsTitle,n.DatePost,n.Content,c.CatName,t.TagName FROM news n join category_child cc on n.CatChild_ID = cc.CatChild_ID join category c on cc.CatID = c.CatID join tag t on t.TagID = n.TagID WHERE n.Status = 2 AND c.CatID = ${id}  LIMIT ${limit} OFFSET ${offset}`)
    },
    trangSanphamCon: function (id, limit, offset) {
        return db.load(`SELECT n.Avatar, n.NewsID,n.NewsTitle,t.TagName,n.Content,c.CatName,n.DatePost, cc.CatChildName FROM news n JOIN category_child cc on n.CatChild_ID = cc.CatChild_ID JOIN category c on c.CatID = cc.CatID join tag t on t.TagID = n.TagID  WHERE  n.Status = 2 AND n.CatChild_ID = ${id} LIMIT ${limit} OFFSET ${offset}`)
    },
    tongtrang: async function (id) {
        const totals = await db.load(`SELECT COUNT(*) as totalPage FROM news n JOIN category_child cc on n.CatChild_ID = cc.CatChild_ID join category c on cc.CatID = c.CatID WHERE n.Status = 2 AND c.CatID = ${id}`);
        return totals[0].totalPage;
    },
    tongtrangCon: async function (id) {
        const totals = await db.load(`SELECT COUNT(*) as totalPage FROM news n JOIN category_child cc on n.CatChild_ID = cc.CatChild_ID join category c on cc.CatID = c.CatID WHERE n.Status = 2 AND n.CatChild_ID = ${id}`);
        return totals[0].totalPage;
    },
    listTag: function (name) {
        return db.load(`SELECT c.CatID, n.Avatar, n.NewsID,n.NewsTitle,t.TagName,n.Content,c.CatName,n.DatePost FROM news n JOIN category_child cc on n.CatChild_ID = cc.CatChild_ID JOIN category c on c.CatID = cc.CatID join tag t on t.TagID = n.TagID  WHERE n.Status = 2 AND  t.TagName = '${name}'`)
    },
    searchPost: function (value) {
        return db.load(`SELECT *  FROM news n join tag t on n.TagID = t.TagID WHERE n.Status = 2 AND
        MATCH(NewsTitle) 
        AGAINST('${value}')`)
    },
    NewPost: function (entity) {
        return db.add(TBL_NEWS, entity);
    },
    DSBVPV: function (id) {
        return db.load(`select * from ${TBL_NEWS} where Status = 4 or Status = 3 and   Author = ${id}`);
    },
    selectEditPost: function (id) {
        return db.load(`SELECT * FROM news where NewsID = ${id}`);
    },
    updatePost: function (entity, idUser) {

        let condition = {
            NewsID: idUser
        }
        return db.patch(TBL_NEWS, entity, condition);
    },
    selectPost: function (id) {
        return db.load(`SELECT * FROM news where Status = 2 AND NewsID = ${id}`);
    },
    ListCM: function () {
        return db.load(`SELECT DISTINCT TagName FROM tag`);
    }
};