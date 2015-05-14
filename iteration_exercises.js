Array.prototype.bubbleSort = function(){
  var sorted = false;

  while(sorted !== true) {
    sorted = true;
    for(var i = 0; i < (this.length - 1); i++){
      var left = this[i];
      var right = this[i + 1];

      if(left > right){
        sorted = false;
        this[i] = right;
        this[i + 1] = left;
      }
    }
  }
  return this;
};


// console.log([5, 2, 7, 11].bubbleSort());


function substrings(string) {
  result = [];
  for(var start = 0; start < string.length; start++){
    for(var end = (start + 1); end <= string.length; end++){
      result.push(string.substring(start, end));
    }
  }
  return result;
}

// console.log(substrings("cat"));
