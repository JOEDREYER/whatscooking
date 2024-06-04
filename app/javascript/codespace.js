const myPromise = new Promise((resolve, reject) => {
  let success = Math.random() > 0.5; // Randomly succeed or fail

  if (success) {
      resolve("The operation was successful!");
  } else {
      reject("The operation failed.");
  }
});

myPromise
  .then(result => {
      console.log(result); // If success, outputs: The operation was successful!
  })
  .catch(error => {
      console.log(error); // If failure, outputs: The operation failed.
  });



































  
//   // callback hell :

//   asyncOperation1((result1) => {
//     asyncOperation2(result1, (result2) => {
//         asyncOperation3(result2, (result3) => {
//             // More nested operations
//         });
//     });
// });

// // prvides cleaner code:

// asyncOperation1()
//     .then(result1 => asyncOperation2(result1))
//     .then(result2 => asyncOperation3(result2))
//     .then(result3 => {
//         // Continue with the result
//     })
//     .catch(error => {
//         // Handle errors
//     });


// //     2. Chaining Operations
// // Promises allow for chaining operations, where the output of one promise can be passed as input to the next. This chaining makes it easier to follow the sequence of asynchronous operations.

// fetchData()
//     .then(processData)
//     .then(saveData)
//     .then(result => {
//         console.log('Data saved:', result);
//     })
//     .catch(error => {
//         console.error('An error occurred:', error);
//     });
