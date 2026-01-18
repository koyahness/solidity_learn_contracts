// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Mappings {

    mapping (address => uint) favoriteNumbers; // a relationship between an address and a uint

    //But what if your users have favorite colors too? Or favorite cars? etc
    //ou could create a mapping for each of these, but it would quickly get awkward.
    //e.g.
    // mapping (address => uint) favoriteNumbers;
    // mapping (address => uint) birthDay;
    // mapping (address => string) favoriteColor;
    // mapping (address => array) lotteryNumbers;

    struct Favorites {
    uint favoriteNumber;
    uint birthDay;
    string favoriteColor;
    uint[5] lotteryNumbers; //lottery has five numbers
}




}