// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

library SillyStringUtils {

    struct Haiku {
        string line1;
        string line2;
        string line3;
    }

    function shruggie(string memory _input) internal pure returns (string memory) {
        return string.concat(_input, unicode" 🤷");
    }
}


// Create a contract called ImportsExercise. It should import a copy of SillyStringUtils

contract ImportsExercise {

using SillyStringUtils for SillyStringUtils.Haiku; //import the library


SillyStringUtils.Haiku public haiku;


// saveHaiku should accept three strings and save them as the lines of haiku.
function saveHaiku (string _line1, string _line2, string _line3) public {
    
    haiku.line1 = _line1;
    haiku.line2 = _line2;
    haiku.line3 = _line3;

}

// saveHaiku should accept three strings and save them as the lines of haiku.
function getHaiku () public return (Haiku) {
    return haiku;
}

}