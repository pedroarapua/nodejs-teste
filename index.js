
const koa = require('koa');
const app = koa();

app.use(function * (){
  yield;
  this.body = 'Hello World 1';
});

app.listen(process.env.PORT || 5000);
