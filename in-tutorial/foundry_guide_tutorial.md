# Foundry guide

Foundry is a powerful suite of tools to develop, test, and debug your smart contracts. It comprises several individual tools:

* forge: the main workhorse of Foundry — for developing, testing, compiling, and deploying smart contracts

* cast: a command-line tool for performing Ethereum RPC calls (e.g., interacting with contracts, sending transactions, and getting onchain data)
  
* anvil: a local testnet node, for testing contract behavior from a frontend or over RPC
  
* chisel: a Solidity REPL, for trying out Solidity snippets on a local or forked network

## Have Foundry installed

```bash
curl -L https://foundry.paradigm.xyz | bash
```

## Creating a project

```bash
mkdir myproject
cd myproject
forge init
```

## Foundry project, basic layout

```bash
.
├── foundry.toml
├── script
 │   └── Counter.s.sol
├── src
 │   └── Counter.sol
└── test
    └── Counter.t.sol
```

## simple NFT smart contract (ERC-721) written in the Solidity programming language that can be used to replace src/Counter.sol

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract NFT is ERC721 {
    uint256 public currentTokenId;

    constructor() ERC721("NFT Name", "NFT") {}

    function mint(address recipient) public payable returns (uint256) {
        uint256 newItemId = ++currentTokenId;
        _safeMint(recipient, newItemId);
        return newItemId;
    }
}
```

## add the OpenZeppelin Contracts library

```bash
forge install openzeppelin/openzeppelin-contracts
```

## compiling the contract

```bash
forge build
```

## Storing your private key

```bash
cast wallet import deployer --interactive
```


