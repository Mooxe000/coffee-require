'use strict';

function _interopDefault (ex) { return (ex && (typeof ex === 'object') && 'default' in ex) ? ex['default'] : ex; }

var CoffeeScript = _interopDefault(require('coffeescript'));
var babel = _interopDefault(require('babel-core'));
var path = _interopDefault(require('path'));

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

var Module;
var ext;
var findExtension;
var i;
var len;
var loadFile;
var ref;
loadFile = function (module, filename) {
    var answer;
    answer = compile(filename);
    return module._compile(answer, filename);
};
if (require.extensions) {
    ref = CoffeeScript.FILE_EXTENSIONS;
    for (i = 0, len = ref.length; i < len; i++) {
        ext = ref[i];
        require.extensions[ext] = loadFile;
    }
    Module = require('module');
    findExtension = function (filename) {
        var curExtension, extensions;
        extensions = path.basename(filename).split('.');
        if (extensions[0] === '') {
            extensions.shift();
        }
        while (extensions.shift()) {
            curExtension = '.' + extensions.join('.');
            if (Module._extensions[curExtension]) {
                return curExtension;
            }
        }
        return '.js';
    };
    Module.prototype.load = function (filename) {
        var extension;
        this.filename = filename;
        this.paths = Module._nodeModulePaths(path.dirname(filename));
        extension = findExtension(filename);
        Module._extensions[extension](this, filename);
        return this.loaded = true;
    };
}
