// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract ArrayDemo {
    uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];

    function _countEvenNumbers() internal view returns(uint) {
        
    uint result = 0;

    for(uint i = 0; i < numbers.length; i++) {
        if(numbers[i] % 2 == 0) {
            result++;
        }
    }

    return result;
}









    function getEvenNumbers() external view returns(uint[] memory) {
        // TODOhhhhhhhhhhh
    }
}
