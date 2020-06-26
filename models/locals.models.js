const db = require('../utils/db');
const TBL_CATEGORY = 'category';
const TBL_CATEGORY_CHILD = 'category_child';
const TBL_CATEGORY_NEWS = 'news';
const TBL_CATEGORY_TAG = 'tag';

module.exports = {
    menuModels: function () {
        return db.load(`SELECT CatName,CatChildName,c.CatID FROM ${TBL_CATEGORY} c join ${TBL_CATEGORY_CHILD} cc on c.CatID = cc.CatID `);
    },
    single: function (id) {
        return db.load(`select * from ${TBL_USERS} where id = ${id}`);
    },
    chonBVNoiBat: function () {
        return db.load(`SELECT * FROM ${TBL_CATEGORY_NEWS} n join ${TBL_CATEGORY_TAG} t on n.NewsID = T.NewsID order by likee DESC limit 4`);
    },
    chonBV10NoiBat: function () {
        return db.load(`SELECT * FROM category c join category_child cc on c.CatID = cc.CatID join news n on cc.CatChild_ID = n.CatChild_ID join tag t on t.NewsID = n.NewsID order by View DESC limit 10`);
    },
    singleByUserName: async function (username) {
        const rows = await db.load(`select * from ${TBL_USERS} where UserName = '${username}'`);
        if (rows.length === 0)
            return null;
        return rows[0];
    },
    add: function (entity) {
        return db.add(TBL_USERS, entity);
    },
    patch: function (entity) {
        const condition = {
            id: entity.id
        }
        delete entity.id;
        return db.patch(TBL_USERS, entity, condition);
    },
    del: function (id) {
        const condition = { id }
        return db.del(TBL_USERS, condition);
    }
};