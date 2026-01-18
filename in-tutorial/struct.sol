// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Mappings {

    mapping (address => uint) favoriteNumbers; // a relationship between an address and a uint

    

    struct Favorites {
    uint favoriteNumber;
    uint birthDay;
    string favoriteColor;
    uint[5] lotteryNumbers; //lottery has five numbers
}




}