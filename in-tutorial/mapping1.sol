// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Mappings {
    mapping (address => uint) public favoriteNumbers;
    address[] addressesOfFavs;

    function saveFavoriteNumber(uint _favorite) public {
        favoriteNumbers[msg.sender] = _favorite;
        // Imperfect solution, see below
        addressesOfFavs.push(msg.sender); // array to store a list of all the keys present in favoriteNumbers
    }
}

}