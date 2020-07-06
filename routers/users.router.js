const express = require('express');
const moment = require('moment');
const bcrypt = require('bcryptjs');
const userModel = require('../models/user.model');
const router = express.Router();
const config = require('../config/config.json');


router.get('/login', (req, res) => {
    res.render('users/login');
})
router.post('/login', async (req, res) => {
    const username = req.body.UserName;
    let user = await userModel.singleByUserName(username);
    let TimeLogin = new Date().getTime();
    let phut = Math.floor((TimeLogin - +user.TimeRegister) / 60 / 1000);
    if((phut / 60 ) > (7 * 24 * 60)){
        //update typeuser -1;
    }

})
router.get('/categories', (req, res) => {
    res.render('users/categories');
})

router.get('/resetpass', (req, res) => {
    res.render('users/resetpass');
})

router.get('/is-available', async function (req, res) {
    const user = await userModel.singleByUserName(req.query.user);
    if (!user) {
        return res.json(true);
    }
    res.json(false);
})

router.post('/register', async function (req, res) {
    var now = new Date();
    var dob = new Date();
    dob.setDate(now.getDate() - 7);

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
    res.render('home');
})


module.exports = router;