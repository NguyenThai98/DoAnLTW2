const db = require('../utils/db');
const TBL_NEWS = 'news';

module.exports = {
    all: function () {
        return db.load(`select * from ${TBL_USERS}`);
    },
    chitietsp: function (id) {
        return db.load(`SELECT n.Avatar, n.NewsID,n.NewsTitle,t.TagName,n.Content,c.CatName,n.DatePost FROM news n JOIN category_child cc on n.CatChild_ID = cc.CatChild_ID JOIN category c on c.CatID = cc.CatID join tag t on t.TagID = n.TagID  WHERE n.NewsID = ${id}`);
    },
    bvlienquan: function () {
        return db.load(`SELECT n.Avatar, n.NewsID,n.NewsTitle,n.DatePost,t.TagName FROM news n join tag t on n.TagID = t.TagID ORDER BY RAND() LIMIT 5 `);
    },
    trangSanpham: function (id, limit, offset) {
        return db.load(`SELECT n.Abstract, n.NewsID, n.Avatar,n.NewsTitle,n.DatePost,n.Content,c.CatName,t.TagName FROM news n join category_child cc on n.CatChild_ID = cc.CatChild_ID join category c on cc.CatID = c.CatID join tag t on t.TagID = n.TagID WHERE c.CatID = ${id}  LIMIT ${limit} OFFSET ${offset}`)
    },
    tongtrang: async function (id) {
        const totals = await db.load(`SELECT COUNT(*) as totalPage FROM news n JOIN category_child cc on n.CatChild_ID = cc.CatChild_ID join category c on cc.CatID = c.CatID WHERE c.CatID = ${id}`);
        return totals[0].totalPage;
    }

};