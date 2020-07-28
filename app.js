const express = require('express');
const app = express();
const PORT = 3000;
var bodyParser = require('body-parser');


app.use(express.urlencoded({
    extended: true
}));
app.use(bodyParser.json());
require('./middlewares/session.mdw')(app);
require('./middlewares/view.mdw')(app);
require('./middlewares/locals.mdw')(app);




app.use('/users', require('./routers/users.router'));
app.use('/post', require('./routers/post.router'));
app.use('/editor', require('./routers/bientapvien.router.js'));

app.use('/public', express.static('public'));

app.get('/', function (req, res) {
    res.render('home');
})

app.use(function (err, req, res, next) {
    console.error(err.stack);
    res.status(500).render('500', {
        layout: false
    });
})

app.listen(PORT, () => {
    console.log(`start sever at port http://localhost:${PORT}`);
})