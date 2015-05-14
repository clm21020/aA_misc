Function.prototype.myBind = function(context) {
  var fn = this;
  return function() {
    return fn.apply(context);
  };
};

function Cat() {
  this.name = "gizmo";
}

Cat.prototype.meow = function () {
  console.log(this.name);
  return 42;
};

var gizmo = new Cat();
var f = gizmo.meow.myBind(gizmo);
console.log(f());

// setTimeout(gizmo.meow.myBind(gizmo), 1000);

// function setTimeout(cb, time) {
//   sleep time;
//   cb();
// }
