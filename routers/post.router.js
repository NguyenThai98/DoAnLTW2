const express = require('express');
const router = express.Router();
router.get('/reporter', (req, res) => {
    res.render('post/reporter');
})
router.get('/edit', (req, res) => {
    res.render('post/editPost');
})
module.exports = router;