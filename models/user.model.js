const db = require('../utils/db');
const TBL_USERS = 'user';

module.exports = {
    all: function () {
        return db.load(`select * from ${TBL_USERS}`);
    },
    single: function (id) {
        return db.load(`select * from ${TBL_USERS} where id = ${id}`);
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
    updateTypeUser: function (typeUser, idUser) {
        let entity = {
            TypeOfUser: typeUser
        }
        let condition = {
            UserID: idUser
        }
        console.log(entity, condition);

        return db.patch(TBL_USERS, entity, condition);
    },
    del: function (id) {
        const condition = { id }
        return db.del(TBL_USERS, condition);
    }
};