// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Mappings {

    mapping (address => uint) favoriteNumbers;

    function saveFavoriteNumber(address _address, uint _favorite) public {
    favoriteNumbers[_address] = _favorite;
}

}