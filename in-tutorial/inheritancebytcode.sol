// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract EmptyContract {

}


contract notEmptyContract {
    function sayHello() public pure returns (string memory) {
        return "To whom it may concern, I write you after a long period of silence to alert you that after much reflection, it occurs to me that I don't think you have fully considered...";
    }
}


contract EmptyContract_one is notEmptyContract {

}