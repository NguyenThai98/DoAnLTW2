const express = require('express');
// const moment = require('moment');

const bcrypt = require('bcryptjs');
const userModel = require('../models/user.model');
const router = express.Router();
const config = require('../config/config.json');
const restrict = require('../middlewares/auth.mdw');
const nodemailer = require("nodemailer");


let transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: 'nguyenthai492017@gmail.com',
        pass: '771998Thai'
    }
});

router.get('/login', (req, res) => {
    res.render('users/login');
})
router.post('/login', async (req, res) => {
    let username = req.body.UserNameLogin;
    let pw = req.body.PasswordLogin;
    let user = await userModel.singleByUserName(username);
    let pwh = user.Password;

    let typeUser = user.TypeOfUser;
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
            if (typeUser == 0 || typeUser == -1) {
                delete user.Password;
                req.session.isAuthenticated = true;
                req.session.authUser = user;
                res.redirect('/');
            } else if (typeUser == 2) {
                delete user.Password;
                req.session.isAuthenticated = true;
                req.session.authUser = user;
                res.redirect('/post/phongvien');
            } else if (typeUser == 3) {
                delete user.Password;
                req.session.isAuthenticated = true;
                req.session.authUser = user;
                res.redirect('/editor');
            }
            else if (typeUser == 4) {
                delete user.Password;
                req.session.isAuthenticated = true;
                req.session.authUser = user;
                res.redirect('/admin');
            }

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
    const username = req.body.username;
    const password = req.body.password;
    let user = await userModel.singleByUserName(username);
    let pwh = user.Password;

    let rs = bcrypt.compareSync(password, pwh);
    if (user && rs) {
        let idUser = user.UserID;
        var now = new Date();
        var dob = new Date();
        dob.setDate(now.getDate());
        dob = dob.getTime();
        await userModel.updateTypeUser(dob, idUser);
        delete user.Password;
        req.session.isAuthenticated = true;
        req.session.authUser = user;
        res.render('users/login', {
            error: "Gia hạn thành công vui lòng đăng nhập lại !!!"
        });
    } else {
        res.render('users/login', {
            error: "username password invalid!",
        })
    }
})
// router.get('/categories', (req, res) => {
//     res.render('users/categories');
// })

router.get('/resetpass', (req, res) => {
    res.render('users/resetpass');
})
function getRandomArbitrary(min, max) {
    return Math.random() * (max - min) + min;
}
router.post('/resetpass', async (req, res) => {

    let username = req.body.UserName;
    let Email = req.body.Email;
    let user = await userModel.singleByUserName(username);

    if (user && user.Email == Email) {
        let text = Math.random().toString(36).substring(7);
        let number = Math.floor(getRandomArbitrary(1000, 10000)) + "";
        let pw = text + number;
        let password_hash = bcrypt.hashSync(pw, config.authentication.saltRounds);
        await userModel.updatePw(password_hash, user.UserID);
        let content = `<ul>
        <li>Reset Password</li>
        <li> Mật khẩu của bạn là: ${pw}</li>
    </ul>
    `;
        let mailOptions = {
            from: 'nguyenthai4920178@gmail.com',
            to: 'thongvo306@gmail.com',
            subject: 'Reset password from NguyenThai',
            text: 'Reset password',
            html: content
        };
        transporter.sendMail(mailOptions, function (error, rs) {
            if (error) {
                return console.log(error);
            } else {
                res.render('users/login', {
                    error: "vui lòng check mail!!",
                });
            }
        })
    } else {
        res.render('users/login', {
            error: "username or email invalid!",
        });
    }
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
    res.redirect('/');

})
router.post('/register', async function (req, res) {
    var now = new Date();
    var dob = new Date();
    dob.setDate(now.getDate() - 3);

    dob = dob.getTime();

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