require('coffeescript/register');
module.exports = function(coffeeSource) {
  return require('./src')(coffeeSource, module.parent.filename);
}
