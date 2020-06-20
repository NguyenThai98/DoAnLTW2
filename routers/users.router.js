const express = require('express');
const router = express.Router();

router.get('/login', (req, res) => {
    res.render('users/login');
})
router.get('/categories', (req, res) => {
    res.render('users/categories');
})
router.get('/listCategories', (req, res) => {
    res.render('users/listCategories');
})
module.exports = router;