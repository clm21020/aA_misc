Array.prototype.myEach = function(method) {
  for(var i = 0; i < this.length; i++){
    method.call(null, this[i]);
  }
  return this;
};

printer = function(thing){
  console.log(thing);
};

// printer([1, 2, 3].myEach(printer));

Array.prototype.myMap = function(method) {
  var result = [];
  var method2 = function(thing) {
    result.push(method.call(null, thing));
  };
  this.myEach(method2);
  return result;
};

timesTwo = function(thing){
  return (thing * 2);
};

// printer([1, 2, 3].myMap(timesTwo));

Array.prototype.myInject = function(method) {
  var result;

  method2 = function(val) {
    if(result === undefined){
      result = val;
    } else {
      result = method.call(null, result, val);
    }
  };
  this.myEach(method2);

  return result;
};

var addTwo = function(accum, val) {
  return (accum + val);
};

//printer([1, 2, 3].myInject(addTwo));
