function range(start, end) {
  if(start > end){
    return [];
  } else {
    var result = range(start, end - 1);
    result.push(end);
    return result;
  }
}

// console.log(range(1, 7));

function exp(b, n) {
  if(n === 0) {
    return 1;
  } else {
    return b * exp(b, n - 1);
  }
}

// console.log(exp(2, 3));

function better_exp(b, n) {
  if(n === 0) {
    return 1;
  } else if (n === 1) {
    return b;
  } else if (n % 2 === 0) {
    root = exp(b, n / 2);
    return root * root;
  } else {
    root = exp(b, (n - 1) / 2);
    return root * root * b;
  }
}

// console.log(better_exp(2, 3));


function fibonacci(num){
  if (num === 0 ){
    return [];
  } else if (num === 1) {
    return [0];
  } else if (num === 2) {
    return [0, 1];
  } else {
    var prevFibs = fibonacci(num - 1);
    var last = prevFibs[prevFibs.length - 1];
    var nextLast = prevFibs[prevFibs.length - 2];
    var next = last + nextLast;
    prevFibs.push(next);
    return prevFibs;
  }
}

// console.log(fibonacci(10));

function bsearch(array, target){
  if (array.length === 0){
    return null;
  }

  middleIndex = array.length / 2;
  middleValue = array[middleIndex];

  if (middleValue === target){
    return middleIndex;
  } else if (target < middleValue){
    var lowerHalf = array.slice(0, middleIndex);
    return bsearch(lowerHalf, target);
  } else {
    var upperHalf = array.slice(middleIndex + 1, array.length);
    search = bsearch(upperHalf, target);
    return (search === null ? null : (middleIndex + search + 1));
  }
}



console.log(bsearch([1, 2, 3], 1)); // => 0
// console.log(bsearch([2, 3, 4, 5], 3)); // => 1 yes
// console.log(bsearch([2, 4, 6, 8, 10], 6)); // => 2
// console.log(bsearch([1, 3, 4, 5, 9], 5)); // => 3 yes
// console.log(bsearch([1, 2, 3, 4, 5, 6], 6)); // => 5
// console.log(bsearch([1, 2, 3, 4, 5, 6], 0)); // => nil
// console.log(bsearch([1, 2, 3, 4, 5, 7], 6)); // => nil
