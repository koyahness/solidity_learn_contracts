# Foundry guide

Foundry is a powerful suite of tools to develop, test, and debug your smart contracts. It comprises several individual tools:

* forge: the main workhorse of Foundry — for developing, testing, compiling, and deploying smart contracts

* cast: a command-line tool for performing Ethereum RPC calls (e.g., interacting with contracts, sending transactions, and getting onchain data)
  
* anvil: a local testnet node, for testing contract behavior from a frontend or over RPC
  
* chisel: a Solidity REPL, for trying out Solidity snippets on a local or forked network

## Have Foundry installed

```
curl -L https://foundry.paradigm.xyz | bash
```

## Creating a project

```
mkdir myproject
cd myproject
forge init
```