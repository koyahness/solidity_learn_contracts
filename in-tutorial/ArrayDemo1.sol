// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


// contract ArrayDemo {
//     uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];
//     uint numEven;

//     function _countEvenNumbers() internal view returns(uint) {
// // You aren’t modifying state, so you should mark it as such: view
//     uint result = 0;
//     for(uint i = 0; i < numbers.length; i++) {
//         if(numbers[i] % 2 == 0) {
//             result++;
//         }
//     }

//     return result;
// }

    function getEvenNumbers() external view returns(uint[] memory) {
        // filter through the array to get even numbers
        uint resultsLength = numEven;
        uint[] memory evenNumbers_results = new uint[](resultsLength);
        uint cursor = 0;

     for(uint i = 0; i < numbers.length; i++) { //results in looping through the same array twice
        if(numbers[i] % 2 == 0) {
            evenNumbers_results[cursor] = numbers[i];
            cursor++;
        }
    }

    return evenNumbers_results;
}

}