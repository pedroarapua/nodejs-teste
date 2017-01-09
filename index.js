/*eslint require-yield: "error"*/

const koa = require('koa');
const app = koa();

app.use(function * (){
  this.body = 'Hello World 1';
});

app.listen(3000);
