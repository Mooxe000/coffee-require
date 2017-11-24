'use strict';

function _interopDefault (ex) { return (ex && (typeof ex === 'object') && 'default' in ex) ? ex['default'] : ex; }

var path = _interopDefault(require('path'));
var fs = _interopDefault(require('fs'));
var requireFromString = _interopDefault(require('require-from-string'));
var CoffeeScript = _interopDefault(require('coffeescript'));
var babel = _interopDefault(require('babel-core'));

var coffeeFileToes6;
var es6Toes5;
coffeeFileToes6 = function (filename) {
    return CoffeeScript._compileFile(filename, false, true);
};
es6Toes5 = function (code) {
    var es5;
    es5 = babel.transform(code, {
        presets: [[
                'env',
                { targets: { node: true } }
            ]]
    }, { plugins: ['transform-runtime'] });
    return es5.code;
};
var compile = function (filename) {
    return es6Toes5(coffeeFileToes6(filename));
};

var _require = function (coffeeSource, filePath) {
    var code, require_file;
    filePath || (filePath = module.parent.filename);
    require_file = path.join(path.dirname(filePath), coffeeSource);
    if (fs.statSync(require_file).isDirectory()) {
        require_file = path.join(require_file, './index.coffee');
    }
    code = compile(require_file);
    return requireFromString(code);
};

var coffee_require$1 = {
    require: function (coffeeSource, filePath) {
        filePath || (filePath = module.parent.filename);
        return _require(coffeeSource, filePath);
    },
    gdf: function (obj) {
        return obj.default;
    }
};

module.exports = coffee_require$1;
