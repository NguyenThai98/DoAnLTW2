const db = require('../utils/db');
const TBL_NEWS = 'news';
module.exports = {
    selectPostPV: function (idUser) {
        return db.load(`SELECT  distinct n.Status, c.Manager,  NewsID,NewsTitle   FROM editor_cat e join category c on e.UserID = c.Manager join category_child cc on c.CatID = cc.CatID join news n on cc.CatChild_ID = n.CatChild_ID  where n.Status = 4 or  n.Status = 3  AND e.UserID = ${idUser}`)
    },
    detailsPost: function (id) {
        return db.load(`SELECT n.Avatar, n.NewsID,n.NewsTitle,t.TagName,n.Content,c.CatName,n.DatePost FROM news n JOIN category_child cc on n.CatChild_ID = cc.CatChild_ID JOIN category c on c.CatID = cc.CatID join tag t on t.TagID = n.TagID  WHERE n.NewsID = ${id}`);
    }, updatePost: function (status, idUser) {
        let entity = {
            Status: status
        }
        let condition = {
            NewsID: idUser
        }
        return db.patch(TBL_NEWS, entity, condition);
    },
}
