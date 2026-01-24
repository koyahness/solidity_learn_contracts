// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// libraries
import "./EnumerableSet.sol";

using EnumerableSet for EnumerableSet.AddressSet;

contract WeightedVoting {

uint public maxSupply;

constructor {
    maxSupply = 1,000,000;
}


error TokensClaimed()
error AllTokensClaimed()
error NoTokensHeld()
error QuorumTooHigh() //returning the quorum amount proposed
error AlreadyVoted()
error VotingClosed()



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



}