// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// libraries
import "./EnumerableSet.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";



contract WeightedVoting is ERC20 {

using EnumerableSet for EnumerableSet.AddressSet;

uint public maxSupply;
uint public claimedSupply;
// Issue[] public issues;

constructor {
    maxSupply = 1000000;
}

error TokensClaimed();
error AllTokensClaimed();
error NoTokensHeld();
error QuorumTooHigh(int256 quorum); //returning the quorum amount proposed
error AlreadyVoted();
error VotingClosed();

struct Issue {
    EnumerableSet.AddressSet private voters;
    string issueDesc;
    uint votesFor;
    uint votesAgainst;
    uint votesAbstain;
    uint totalVotes;
    uint quorum;
    bool passed;
    bool closed;
}

enum Vote { AGAINST, FOR, ABSTAIN }

Issue[] public issues;

//mint to other users. 
  constructor() ERC20("WeightedVoting", "WV") {
        // Burn zeroeth element fo issue struct array issue[0] should retrun nothing
        issues.push();
    }

mapping (address => bool) public claimed;

function claim () public {
uint claimTokens = 100;
if (claimed[msg.sender] == false){

if (maxSupply >=  claimTokens){
     _mint(msg.sender, claimTokens);
    claimed[msg.sender] == true;
    maxSupply -= claimTokens;
    claimedSupply += claimTokens;
    }else {AllTokensClaimed()}


} else {revert TokensClaimed()}

}



function createIssue(string memory _issueDesc, uint _quorum) external returns (uint) {
    
    if (balance[msg.sender] > 0){

        if(claimedSupply > _quorum){
        issues.issueDesc = _issueDesc;
        issues.quorum = _quorum;
        return issues[];
        } else {revert QuorumTooHigh(int256 quorum)}

} else {revert NoTokensHeld()}

}







}
