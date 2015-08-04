Array.prototype.each = Array.prototype.forEach;
Array.prototype.append = Array.prototype.push;
Array.prototype.zip = function(array) {
  var that = this;
  return that.map(function(_,i){
      return [that, array].map(function(ary){ return ary[i]})
  });
}

define(Array, "find", function (predicate) {
    for (var i = 0; i < this.length; i++) {
        if (predicate(this[i], i)) return this[i];
    }
    return undefined;
});

define(Array, "head", function () {
    return this[0];
});

define(Array, "exists", function(predicate) {
    return this.find(predicate) != undefined;
});


Function.identity = function(x){
    return x;
};

RegExp.escape = function(string){
    return string.replace(/([.*+?^${}()|\[\]\/\\])/g, "\\$1");
}

function define(object, name, fun) {
    if (!object.prototype[name]) object.prototype[name] = fun;
}

define(String, "contains", function(value) {
   return this.indexOf(value) != -1;
});

define(String, "startsWith", function(value) {
   return this.indexOf(value) == 0;
});


function Selection() {}
Selection.prototype = [];
Selection.prototype.on = function(name, fun) {
    this.each(function(element) {
        element.addEventListener(name, fun);
    });
};
Selection.prototype.attribute = function(name, value) {
    if(value == null) return this.map(function(element) {
        return element.getAttribute(name);
    });
    return this.map(function(element) {
        return element.setAttribute(name, value);
    });
};
Selection.prototype.text = function(value) {
    if(value == null) return this.map(function(element) {
        return element.textContent;
    });
    return this.map(function(element) {
        return element.textContent = value;
    });
};
Selection.prototype.html = function(value) {
    if(value == null) return this.map(function(element) {
        return element.innerHTML;
    });
    return this.map(function(element) {
        return element.innerHTML = value;
    });
};


function select(selector, element) {
    element = element || document;
    var nodes = element.querySelectorAll(selector);
    var array = new Selection();
    for (var i = 0; i < nodes.length; ++i) {
        array.append(nodes[i]);
    }
    return array;
}

function head(selector, element){
    return select(selector, element).head();
}

function get(id) {
    return document.getElementById(id);
}

function http(request) {
    var handler = new XMLHttpRequest();
    handler.open(request.method, request.url, true);
    var headers = request.headers || {};
    for (var name in headers) {
        handler.setRequestHeader(name, headers[name]);
    }
    return function (responseHandler) {
        handler.addEventListener("readystatechange", function () {
            if (handler.readyState == 4) {
                var headers = handler.getAllResponseHeaders().split("\n").reduce(function(accumulator, header) {
                    var pair = header.split(": ");
                    accumulator[pair[0]] = pair[1];
                    return accumulator;
                }, {});
                var entity = {
                    toXml: function () {
                        return handler.responseXML;
                    },
                    toText: function () {
                        return handler.responseText;
                    }
                };
                responseHandler({status: handler.status, headers: headers, entity: entity});
            }
        });
        handler.send(request.entity);
        return function () {
            handler.abort();
        }
    };
}

function html(name, attributes, value){
    if(arguments.length == 2){
        value = attributes;
        attributes = {};
    } else if (arguments.length == 1) {
        value = '';
        attributes = {};
    }
    var e = document.createElement(name);
    for (var name in attributes) {
        e.setAttribute(name, attributes[name]);
    }
    e.innerHTML = value;
    return e;
}

function onLoad(handler) {
    document.addEventListener('DOMContentLoaded', handler);
}

String.prototype.validEmail = function() {
    var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    return re.test(this);
}

String.prototype.reverse = function() {
    return this.split("").reverse().join("");
}

String.prototype.pop = function(){
    return this.substring(0, str.length - 1);
}

String.prototype.last = function(){
    return this.slice(-1);
}

String.prototype.head = function(){
    return this[0];
}

String.prototype.shift = function() {
  return this.substring(1, this.length);
};

String.prototype.validName = function(){
  return (!this.contains(" ") && !this.length < 64)
}

String.prototype.isEmpty = function(){
  return this == "";
}