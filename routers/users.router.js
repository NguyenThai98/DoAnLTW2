const express = require('express');
const moment = require('moment');
const bcrypt = require('bcryptjs');
const userModel = require('../models/user.model');
const router = express.Router();
const config = require('../config/config.json');


router.get('/login', (req, res) => {
    res.render('users/login');
})
router.get('/categories', (req, res) => {
    res.render('users/categories');
})
router.get('/listCategories', (req, res) => {
    res.render('users/listCategories');
})
router.get('/resetpass', (req, res) => {
    res.render('users/resetpass');
})



router.get('/is-available', async function(req, res) {
    const user = await userModel.singleByUserName(req.query.user);
    if (!user) {
        return res.json(true);
    }
    res.json(false);
})


router.post('/register', async function(req, res) {

    const dob = moment(req.body.dob, 'DD/MM/YYYY').format('YYYY-MM-DD');
    const password_hash = bcrypt.hashSync(req.body.Password, config.authentication.saltRounds);
    const entity = {
        UserName: req.body.UserName,
        Password: password_hash,
        TypeOfUser: 0,
        TimeRegister: dob,
        Email: req.body.Email
    }
    await userModel.add(entity);
    res.render('home');
})


module.exports = router;