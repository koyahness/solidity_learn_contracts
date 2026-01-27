// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HaikuNFT {

struct Haiku {
    address authorAddress;
    string line1;
    string line2;
    string line3;
    uint haikuid;
}

Haiku[] public haikus;

mapping (address => _haikuid) sharedHaikus;


uint counter = 1;
uint public mintedcounter = counter - 1;


constructor () {
    
    }

error HaikuNotUnique();

function mintHaiku (string memory _line1, string memory _line2, string memory _line3) external {
//if(If any line in the Haiku has been used as any line of a previous Haiku, revert with HaikuNotUnique())

for(uint i = 0; i < haikus.length; i++) {
    if((haikus[i]).line1 !=  _line1 || (haikus[i]).line1 !=  _line2 || (haikus[i]).line1 !=  _line3
    || (haikus[i]).line2 !=  _line1 || (haikus[i]).line2 !=  _line2 || (haikus[i]).line2 !=  _line3
    || (haikus[i]).line3 !=  _line1 || (haikus[i]).line3 !=  _line2 || (haikus[i]).line3 !=  _line3
    ) {
        Haiku haiku_init = Haiku();
    haiku_init.authorAddress = msg.sender;
    haiku_init.line1 = _line1;
    haiku_init.line2 = _line2;
    haiku_init.line3 = _line3;
    haiku_init.haikuid = counter;
    haikus = haikus.push(haiku_init);
    sharedHaikus[msg.sender] = haiku_init.haikuid;
    counter++;
    } else {revert HaikuNotUnique();}
}
}

error NotYourHaiku(uint _id);

function shareHaiku (address _to, uint _id) public {

    if (sharedHaikus[msg.sender] == _id){

        sharedHaikus[_to] = _id;

    } else {revert NotYourHaiku(_id)}


}



function getMySharedHaikus () public returns (Haiku[] memory) {
return haikus;
}




}