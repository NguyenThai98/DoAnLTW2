const db = require('../utils/db');
const TBL_USERS = 'user';

module.exports = {
    all: function () {
        return db.load(`select * from ${TBL_USERS}`);
    },
    single: function (id) {
        return db.load(`select * from ${TBL_USERS} where UserID = ${id}`);
    },
    singleByUserName: async function (username) {
        const rows = await db.load(`select * from ${TBL_USERS} where UserName = '${username}'`);
        if (rows.length === 0)
            return null;
        return rows[0];
    },
    singleByProfile: async function (username, id) {
        const rows = await db.load(`select * from ${TBL_USERS} where UserName != '${username}' and UserID != ${id} `);
        if (rows.length === 0)
            return null;
        return rows;
    },
    add: function (entity) {
        return db.add(TBL_USERS, entity);
    },
    updateTypeUser: function (obj, idUser) {
        let entity = {
            TimeRegister: obj.dob,
            TypeOfUser: obj.typeUser
        }
        let condition = {
            UserID: idUser
        }
        return db.patch(TBL_USERS, entity, condition);
    },
    updateType: function (type, idUser) {
        let entity = {
            TypeOfUser: type
        }
        let condition = {
            UserID: idUser
        }
        return db.patch(TBL_USERS, entity, condition);
    },
    updatePw: function (pwh, idUser) {
        let entity = {
            Password: pwh
        }
        let condition = {
            UserID: idUser
        }
        return db.patch(TBL_USERS, entity, condition);
    },

    del: function (id) {
        const condition = { id }
        return db.del(TBL_USERS, condition);
    },
    updateProfile: function (entity, idUser) {
        let condition = {
            UserID: idUser
        }
        return db.patch(TBL_USERS, entity, condition);
    },
};