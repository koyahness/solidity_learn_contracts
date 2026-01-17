// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Mappings {
    mapping (address => uint) public favoriteNumbers;
    address[] addressesOfFavs;

    function saveFavoriteNumber(uint _favorite) public {
        if(favoriteNumbers[msg.sender] == 0) { //check first if the address already has a number as a value in favoriteNumbers
            addressesOfFavs.push(msg.sender);
        }
        favoriteNumbers[msg.sender] = _favorite;
        // Imperfect solution, see below
         // array to store a list of all the keys present in favoriteNumbers
    }
//mapping data type is that it is not iterable - you cannot loop through and manipulate or return all values in the mapping
//helper array  helper array to store a list of all the keys present in favoriteNumbers

//To return all of the favorite numbers, you can then iterate through addressesOfFavs
// look up that addresses’ favorite number, add it to a return array, and then return the array when you’re done

function returnAllFavorites() public view returns (uint[] memory) {
    uint[] memory allFavorites = new uint[](addressesOfFavs.length);

    for(uint i = 0; i < allFavorites.length; i++) {
        allFavorites[i] = favoriteNumbers[addressesOfFavs[i]];
    }

    return allFavorites;
}


}