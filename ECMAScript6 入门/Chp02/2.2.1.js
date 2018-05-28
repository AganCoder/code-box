'use strict'

function f() {
  console.log('I am out side');  
}

(function () {
  if (false) {
    function f() {
      console.log("I am inside!");      
    }
  }
  f();
}())


if (true) {
  function func() {
    console.log("true func");    
  }
} else {
  function func() {
    console.log("false func");    
  }
}
