var readline = require('readline');
var reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
  if (numsLeft === 0) {
    completionCallback(sum);
    reader.close();
  } else {
    reader.question("Enter a number:", function (numString1) {
      var num = parseInt(numString1);
      sum += num;
      console.log("Current Sum: " + sum);
      numsLeft--;
      addNumbers(sum, numsLeft, completionCallback);
    });
  }
}

addNumbers(0, 10, function(sum) {
  console.log("Total Sum: " + sum);
});
