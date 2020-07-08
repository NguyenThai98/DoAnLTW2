const express = require('express');
// const moment = require('moment');
const bcrypt = require('bcryptjs');
const userModel = require('../models/user.model');
const router = express.Router();
const config = require('../config/config.json');
const restrict = require('../middlewares/auth.mdw');

router.get('/login', (req, res) => {
    res.render('users/login');
})
router.post('/login', async (req, res) => {
    let username = req.body.UserNameLogin;
    let pw = req.body.PasswordLogin;
    let user = await userModel.singleByUserName(username);
    let pwh = user.Password;

    let rs = await bcrypt.compareSync(pw, pwh);

    if (user && rs) {
        let TimeLogin = new Date().getTime();
        let idUser = user.UserID;
        let phut = Math.floor((TimeLogin - +user.TimeRegister) / 60 / 1000);
        if (phut > 10080) {
            await userModel.updateTypeUser(-1, idUser);
            res.render('users/login', {
                error: "Tài Khoản Bạn Cần Gia Hạn !",
            });
        } else {
            delete user.Password;
            req.session.isAuthenticated = true;
            req.session.authUser = user;
            const url = req.query.retUrl || '/';
            res.redirect(url);
        }
    } else {
        res.render('users/login', {
            error: "username or password invalid!",
        });
    }
})

router.get('/extension', (req, res) => {
    res.render('users/extension');
})
router.post('/extension', async (req, res) => {
    const username = req.body.extension;
    let user = await userModel.singleByUserName(username);
    if (user == null) {
        res.render('users/login', {
            error: "Tài Khoản chưa đăng ký!",
        })
    } else {
        let idUser = user.UserID;
        await userModel.updateTypeUser(0, idUser);
        delete user.Password;
        req.session.isAuthenticated = true;
        req.session.authUser = user;
        res.render('users/login', {
            error: "Gia hạn thành công vui lòng đăng nhập lại !!!"
        });
    }
})
// router.get('/categories', (req, res) => {
//     res.render('users/categories');
// })

router.get('/resetpass', restrict, (req, res) => {
    res.render('users/resetpass');
})
router.get('/profile', (req, res) => {
    res.render('users/profile');
})
router.get('/is-available', async function (req, res) {
    const user = await userModel.singleByUserName(req.query.user);
    if (!user) {
        return res.json(true);
    }
    res.json(false);
})
router.post('/logout', restrict, async (req, res) => {
    req.session.isAuthenticated = false;
    req.session.authUser = null;
    res.redirect(req.headers.referer);

})
router.post('/register', async function (req, res) {
    var now = new Date();
    var dob = new Date();
    dob.setDate(now.getDate() - 3);

    dob = dob.getTime();
    console.log(dob);

    const password_hash = bcrypt.hashSync(req.body.Password, config.authentication.saltRounds);
    const entity = {
        UserName: req.body.UserName,
        Password: password_hash,
        TypeOfUser: 0, // = 0 là độc giả
        TimeRegister: dob,
        Email: req.body.Email
    }
    await userModel.add(entity);
    res.redirect('/users/login');
})


module.exports = router;