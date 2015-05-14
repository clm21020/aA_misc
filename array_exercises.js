Array.prototype.uniq = function() {
  var result = [];
  this.forEach( function(el) {
    if(result.indexOf(el) === -1) {
      result.push(el);
    }
  });
  return result;
};

// console.log([1, 2, 1, 3, 3].uniq()); // => [1, 2, 3]


Array.prototype.two_sum = function() {
  var result = [];
  this.forEach( function(el, idx) {
    matchIdx = arr.indexOf(0 - el);
    if(matchIdx > idx){
      result.push([idx, matchIdx]);
    }
  });
  return result;
};


// console.log([-1, 0, 2, -2, 1].two_sum()); // => [[0, 4], [2, 3]]

function my_transpose(matrix){
  var result = [];
  for(var i = 0; i < matrix.length; i++) {
    var col = [];
    for(var j = 0; j < matrix[i].length; j++){
      col.push(matrix[j][i]);
    }
    result.push(col);
  }
  return result;
}

// console.log(my_transpose([
//     [0, 1, 2],
//     [3, 4, 5],
//     [6, 7, 8]
//   ]));
//  // # => [[0, 3, 6],
//  // #    [1, 4, 7],
//  // #    [2, 5, 8]]
