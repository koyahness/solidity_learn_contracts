// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

contract WeightedVoting is ERC20 {
    using EnumerableSet for EnumerableSet.AddressSet;
    
    uint256 public constant maxSupply = 1000000; // 1 million tokens (no decimals for this exercise)
    
    // Custom errors
    error TokensClaimed();
    error AllTokensClaimed();
    error NoTokensHeld();
    error QuorumTooHigh(uint256 quorum);
    error AlreadyVoted();
    error VotingClosed();
    
    // Struct untuk Issue
    struct Issue {
        EnumerableSet.AddressSet voters;
        string issueDesc;
        uint256 votesFor;
        uint256 votesAgainst;
        uint256 votesAbstain;
        uint256 totalVotes;
        uint256 quorum;
        bool passed;
        bool closed;
    }
    
    // Array of Issues
    Issue[] private issues;
    
    // Enum untuk Vote
    enum Vote {
        AGAINST,
        FOR,
        ABSTAIN
    }
    
    // Mapping untuk track siapa yang sudah claim
    mapping(address => bool) public hasClaimed;
    
    constructor() ERC20("WeightedVoting", "WV") {
        // Burn zeroeth element dengan membuat issue kosong
        issues.push();
        // Initialize the first issue dengan data kosong
        issues[0].issueDesc = "";
        issues[0].quorum = 0;
    }
    
    // Override decimals untuk menggunakan 0 decimals
    function decimals() public pure override returns (uint8) {
        return 0;
    }
    
    function claim() public {
        // Check jika semua token sudah terdistribusi
        if (totalSupply() >= maxSupply) {
            revert AllTokensClaimed();
        }
        
        // Check jika wallet sudah pernah claim
        if (hasClaimed[msg.sender]) {
            revert TokensClaimed();
        }
        
        // Mint 100 tokens (tanpa decimals)
        uint256 claimAmount = 100;
        
        // Check jika minting ini akan melebihi maxSupply
        if (totalSupply() + claimAmount > maxSupply) {
            revert AllTokensClaimed();
        }
        
        // Mark sebagai sudah claim dan mint tokens
        hasClaimed[msg.sender] = true;
        _mint(msg.sender, claimAmount);
    }
    
    function createIssue(string memory _issueDesc, uint256 _quorum) external returns (uint256) {
        // Check jika user memegang token
        if (balanceOf(msg.sender) == 0) {
            revert NoTokensHeld();
        }
        
        // Check jika quorum tidak lebih besar dari total supply
        if (_quorum > totalSupply()) {
            revert QuorumTooHigh(_quorum);
        }
        
        // Buat issue baru
        issues.push();
        uint256 issueIndex = issues.length - 1;
        
        Issue storage newIssue = issues[issueIndex];
        newIssue.issueDesc = _issueDesc;
        newIssue.quorum = _quorum;
        newIssue.votesFor = 0;
        newIssue.votesAgainst = 0;
        newIssue.votesAbstain = 0;
        newIssue.totalVotes = 0;
        newIssue.passed = false;
        newIssue.closed = false;
        
        return issueIndex;
    }
    
    // Struct untuk return data dari getIssue (karena EnumerableSet tidak bisa di-return)
    struct IssueView {
        address[] voters;
        string issueDesc;
        uint256 votesFor;
        uint256 votesAgainst;
        uint256 votesAbstain;
        uint256 totalVotes;
        uint256 quorum;
        bool passed;
        bool closed;
    }
    
    function getIssue(uint256 _id) external view returns (IssueView memory) {
        require(_id < issues.length, "Issue does not exist");
        
        Issue storage issue = issues[_id];
        
        // Convert EnumerableSet ke array
        uint256 voterCount = issue.voters.length();
        address[] memory voterList = new address[](voterCount);
        
        for (uint256 i = 0; i < voterCount; i++) {
            voterList[i] = issue.voters.at(i);
        }
        
        return IssueView({
            voters: voterList,
            issueDesc: issue.issueDesc,
            votesFor: issue.votesFor,
            votesAgainst: issue.votesAgainst,
            votesAbstain: issue.votesAbstain,
            totalVotes: issue.totalVotes,
            quorum: issue.quorum,
            passed: issue.passed,
            closed: issue.closed
        });
    }
    
    function vote(uint256 _issueId, Vote _vote) public {
        require(_issueId < issues.length && _issueId > 0, "Invalid issue ID");
        
        Issue storage issue = issues[_issueId];
        
        // Check jika voting sudah ditutup
        if (issue.closed) {
            revert VotingClosed();
        }
        
        // Check jika user sudah vote
        if (issue.voters.contains(msg.sender)) {
            revert AlreadyVoted();
        }
        
        // User harus memegang token untuk vote
        uint256 userTokens = balanceOf(msg.sender);
        if (userTokens == 0) {
            revert NoTokensHeld();
        }
        
        // Add voter ke set
        issue.voters.add(msg.sender);
        
        // Add votes berdasarkan pilihan
        if (_vote == Vote.FOR) {
            issue.votesFor += userTokens;
        } else if (_vote == Vote.AGAINST) {
            issue.votesAgainst += userTokens;
        } else {
            issue.votesAbstain += userTokens;
        }
        
        issue.totalVotes += userTokens;
        
        // Check jika quorum tercapai
        if (issue.totalVotes >= issue.quorum) {
            issue.closed = true;
            
            // Check jika votes FOR lebih banyak dari AGAINST
            if (issue.votesFor > issue.votesAgainst) {
                issue.passed = true;
            }
        }
    }
}
