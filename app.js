const express = require('express');
const app = express();
const PORT = 3000;
var bodyParser = require('body-parser');

require('express-async-errors');

app.use(express.urlencoded({
    extended: true
}));
app.use(bodyParser.json());
require('./middlewares/session.mdw')(app);
require('./middlewares/view.mdw')(app);
require('./middlewares/locals.mdw')(app);


app.use(function (err, req, res, next) {
    console.error(err.stack);
    res.status(500).render('500', {
        layout: false
    });
})


app.use('/users', require('./routers/users.router'));
app.use('/post', require('./routers/post.router'));
app.use('/editor', require('./routers/bientapvien.router.js'));

app.use('/admin', require('./routers/admin.router'));


app.use('/public', express.static('public'));

app.get('/', function (req, res) {
    res.render('home');
})
app.use(function (req, res) {
    res.render('404');
})
app.use(function (err, req, res, next) {
    res.status(500).render('404');
})

app.listen(PORT, () => {
    console.log(`start sever at port http://localhost:${PORT}`);
})