// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UnburnableToken {
    // Storage variables
    mapping(address => uint256) public balances;
    uint256 public totalSupply;
    uint256 public totalClaimed;
    
    // Mapping to track which addresses have already claimed
    mapping(address => bool) public hasClaimed;
    
    // Custom errors
    error TokensClaimed();
    error AllTokensClaimed();
    error UnsafeTransfer(address _address);
    
    // Constructor - sets total supply to 100,000,000
    constructor() {
        totalSupply = 100_000_000; // No decimals, simple integer tokens
    }
    
    // Claim function - allows claiming 1000 tokens once per address
    function claim() public {
        // Check if all tokens have been claimed
        if (totalClaimed >= totalSupply) {
            revert AllTokensClaimed();
        }
        
        // Check if this address has already claimed
        if (hasClaimed[msg.sender]) {
            revert TokensClaimed();
        }
        
        // Mark address as having claimed
        hasClaimed[msg.sender] = true;
        
        // Add 1000 tokens to balance (no decimals)
        uint256 claimAmount = 1000;
        balances[msg.sender] += claimAmount;
        totalClaimed += claimAmount;
    }
    
    // Safe transfer function with safety checks
    function safeTransfer(address _to, uint256 _amount) public {
        // Check if recipient is not zero address
        if (_to == address(0)) {
            revert UnsafeTransfer(_to);
        }
        
        // Check if recipient has balance > 0 Base Sepolia ETH
        if (_to.balance == 0) {
            revert UnsafeTransfer(_to);
        }
        
        // Check if sender has sufficient balance
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        
        // Perform transfer
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }
}
