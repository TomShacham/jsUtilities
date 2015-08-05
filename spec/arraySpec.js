// Generated by CoffeeScript 1.9.3
(function() {
  require('../src/array');

  describe("array", function() {
    it("appends shit", function() {
      var array;
      array = [1, 2, 3];
      return expect(array.append(5, 6)).toEqual([1, 2, 3, 5, 6]);
    });
    it("cons's shit", function() {
      var array;
      array = [1, 2, 3];
      return expect(array.cons(-1, 0)).toEqual([-1, 0, 1, 2, 3]);
    });
    it("zips shit", function() {
      var array;
      array = [1, 2, 3];
      return expect(array.zip([4, 5, 6])).toEqual([[1, 4], [2, 5], [3, 6]]);
    });
    it("finds shit", function() {
      var array;
      array = [1, 2, 3, 4];
      expect(array.find(function(x) {
        return x % 2 === 0;
      })).toEqual(2);
      return expect(array.find(function(x) {
        return x % 5 === 0;
      })).toEqual(void 0);
    });
    it("get head or first", function() {
      var array;
      array = [1, 2, 3];
      expect(array.head()).toEqual(1);
      return expect(array.first()).toEqual(1);
    });
    it("tell if element exists", function() {
      var array;
      array = [1, 2, 3];
      expect(array.exists(function(x) {
        return x % 2 === 0;
      })).toBe(true);
      return expect(array.exists(function(x) {
        return x % 5 === 0;
      })).toBe(false);
    });
    return it("identity map does nada", function() {
      var array;
      array = [1, 2, 3];
      return expect(array.map(Function.identity)).toEqual([1, 2, 3]);
    });
  });

}).call(this);
