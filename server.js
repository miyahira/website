var connect = require('connect');
var port = process.env.PORT || 3333;
var oneDay = 86400000;

var app = connect();

app.use(connect.compress())
app.use(connect.logger())
app.use(connect.static(__dirname + '/public', { maxAge: oneDay }))

app.use(function onerror(err, req, res, next) {
   console.error(err)
})

app.listen(port)

console.log(__dirname + '/public')

