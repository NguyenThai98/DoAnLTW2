const db = require('../utils/db');

module.exports = {
    DSALLBVPV: function () {
        return db.load(`select * from news`);
    },
    chitietsp: function (id) {
        return db.load(`SELECT n.Avatar, n.NewsID,n.NewsTitle,t.TagName,n.Content,c.CatName,n.DatePost,n.Status FROM news n JOIN category_child cc on n.CatChild_ID = cc.CatChild_ID JOIN category c on c.CatID = cc.CatID join tag t on t.TagID = n.TagID  WHERE n.NewsID = ${id}`);
    },
    delPost: function (entity) {
        return db.del('news', entity);
    },
}