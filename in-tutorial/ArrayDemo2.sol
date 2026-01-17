// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;



contract ArrayDemo {
    uint[] public numbers; //not to declare array upfront
    uint numEven;

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

    function debugLoadArray(uint _number) external {
        for(uint i = 0; i < _number; i++) {
            numbers.push(i);
            }
            
    }

function _countEvenNumbers() internal view returns(uint) {
// You aren’t modifying state, so you should mark it as such: view
    uint result = 0;
    for(uint i = 0; i < numbers.length; i++) {
        if(numbers[i] % 2 == 0) {
            result++;
        }
    }

    function getEvenNumbers() external view returns(uint[] memory) {
        // filter through the array to get even numbers
        uint resultsLength = _countEvenNumbers();
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