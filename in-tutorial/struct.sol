// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Mappings {

    mapping (address => uint) favoriteNumbers; // a relationship between an address and a uint

    // But what if your users have favorite colors too? Or favorite cars? etc
    // You could create a mapping for each of these, but it would quickly get awkward.
    // e.g.
    // mapping (address => uint) favoriteNumbers;
    // mapping (address => uint) birthDay;
    // mapping (address => string) favoriteColor;
    // mapping (address => array) lotteryNumbers;


    // use struct as custom data type
    struct Favorites {
    uint favoriteNumber; // no users have a favorite number greater than 65,536
    uint birthDay; // everyone is born on a day of the month between 1-31, so could use smaller int
    string favoriteColor;
    uint[5] lotteryNumbers; //lottery has five numbers(else could use dynamic array), we need a collection
}

// Instantiating a Struct with Its Name

Favorites public myFavorites = Favorites({
    favoriteNumber: 29,
    birthDay: 14,
    favoriteColor: "red",
    lotteryNumbers: [uint(1), 2, 3, 4, 5]
});

//  shorthand, skip the member names and curly brackets are not included in this forma

Favorites public myFavorites2 = Favorites(
    239,
    5,
    "green",
    [uint(1), 3, 3, 4, 5]
);

Favorites public myFavorites3 = Favorites(
    439,
    12,
    "blue",
    [uint(1), 5, 3, 4, 5]
);


//to store multiple instances


}