function Clock () {
  this.currentTime = new Date();
}

Clock.TICK = 5000;

Clock.prototype.printTime = function () {
  var hours = this.currentTime.getHours();
  var minutes = this.currentTime.getMinutes();
  var seconds = this.currentTime.getSeconds();
  console.log(hours + ":" + minutes + ":" + seconds);
};

Clock.prototype.run = function () {
  setInterval(this._tick.bind(this), Clock.TICK);
};

Clock.prototype._tick = function () {
  this.currentTime.setMilliseconds(this.currentTime.getMilliseconds() + Clock.TICK);
  this.printTime();
};

var clock = new Clock();
clock.run();
