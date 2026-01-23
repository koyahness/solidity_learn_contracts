# Foundry guide: Deploying smart contract

Foundry is a powerful suite of tools to develop, test, and debug your smart contracts. It comprises several individual tools:

* forge: the main workhorse of Foundry — for developing, testing, compiling, and deploying smart contracts

* cast: a command-line tool for performing Ethereum RPC calls (e.g., interacting with contracts, sending transactions, and getting onchain data). Interact with the Blockchain over RPC, You can make smart contract calls, send transactions, or retrieve any type of chain data.
  
* anvil: a local testnet node, for testing contract behavior from a frontend or over RPC
  
* chisel: a Solidity REPL, for trying out Solidity snippets on a local or forked network. You can write Solidity code directly

## Have Foundry installed

```bash
curl -L https://foundry.paradigm.xyz | bash

foundryup
```
## Version verification

```bash
forge --version
cast --version
chisel --version
anvil --version
```

## Creating a project

```bash
mkdir myproject
cd myproject
forge init
```
or run:

```bash
forge init hello_foundry_in_base
```

output:

```
├── lib          # all the libraries installed
├── script       # scripts folder, e.g., deploy scripts
├── src          # smart contracts folder
├── test         # tests folder
└── foundry.toml # foundry configuration file
```
<!-- notice a .gitmodules file — this is because Foundry handles dependencies using Git submodules. -->

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

<!-- By default the Foundry structure stores smart contracts in the src folder. You can change this in the foundry.toml configuration file. -->

```bash
[profile.default]
src = 'contracts'
```
other settings in the foundry.toml file

```bash
[profile.default]
src = 'src'
out = 'out'
libs = ['lib']
solc_version = "0.8.23"
```

other settings in the foundry.toml file

```json
[profile.default]
src = "src"
out = "out"
libs = ["lib"]
solc_version = "0.8.23"

[rpc_endpoints]
base = "https://mainnet.base.org"
baseSepolia = "https://sepolia.base.org"

[etherscan]
baseSepolia = { key = "${BASESCAN_API_KEY}", url = "https://api-sepolia.basescan.org/api" }
base = { key = "${BASESCAN_API_KEY}", url = "https://api.basescan.org/api" }
```
Two JSON RPC endpoints for Base and Base Sepolia are included and similar for the Etherscan section, we included the configuration for Basescan for Sepolia and Mainnet. Both rely on the same API Key, BASESCAN_API_KEY.


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

In order to compile the project, run:

```bash
forge build
```

## Storing your private key

```bash
cast wallet import deployer --interactive
cast wallet list
```

## Adding Base as a network

API key to be defined as ETHERSCAN_API_KEY

```bash
nano .env

# add the follwing to the file

BASE_MAINNET_RPC="https://mainnet.base.org"
BASE_SEPOLIA_RPC="https://sepolia.base.org"
ETHERSCAN_API_KEY="<YOUR API KEY>"

```

## Loading environment variables

load the environment variables in the current command line session:

```bash
source .env
```

## Deploying the smart contract

```bash
forge create ./src/NFT.sol:NFT --rpc-url $BASE_SEPOLIA_RPC --account deployer

forge create ./src/NFT.sol:NFT --rpc-url $BASE_MAINNET_RPC --account deployer
```

## Verifying the Smart Contract

```bash
forge verify-contract <DEPLOYED_ADDRESS> ./src/NFT.sol:NFT --chain 84532 --watch
```

***output**

```
Start verifying contract `0x71bfCe1172A66c1c25A50b49156FAe45EB56E009` deployed on base-sepolia

Submitting verification for [src/NFT.sol:NFT] 0x71bfCe1172A66c1c25A50b49156FAe45EB56E009.

Submitted contract for verification:

        Response: `OK`
        GUID: `3i9rmtmtyyzkqpfvy7pcxj1wtgqyuybvscnq8d7ywfuskss1s7`
        URL:
        https://sepolia.basescan.org/address/0x71bfce1172a66c1c25a50b49156fae45eb56e009

Contract verification status:
Response: `NOTOK`
Details: `Pending in queue`
Contract verification status:
Response: `OK`
Details: `Pass - Verified`
Contract successfully verified
```

You can’t re-verify a contract identical to one that has already been verified. If you attempt to do so, such as verifying the above contract, you’ll get an error similar to:

```
Start verifying contract `0x71bfCe1172A66c1c25A50b49156FAe45EB56E009` deployed on base-sepolia

Contract [src/NFT.sol:NFT] "0x71bfCe1172A66c1c25A50b49156FAe45EB56E009" is already verified. Skipping verification.
```

## Interacting with the Smart Contract

If verified on BaseScan/Etherscan, one can use the Read Contract and Write Contract sections under the Contract tab to interact with the deployed contract.

To use Write Contract, one to connect web3 wallet first, by clicking the Connect to Web3 button.

This can be done with Foundry using cast, key component of the Foundry toolkit.

## Performing a call

* Cast enables us to interact with contracts, send transactions, and get onchain data using Ethereum RPC calls.
  
* Perform a call from your account, without publishing a transaction.

```bash
cast call <DEPLOYED_ADDRESS> --rpc-url $BASE_SEPOLIA_RPC "balanceOf(address)" <YOUR_ADDRESS_HERE>
```

output is as follows:

```
You should receive 0x0000000000000000000000000000000000000000000000000000000000000000 in response, which equals 0 in hexadecimal. And that makes sense — while you’ve deployed the NFT contract, no NFTs have been minted yet and therefore your account’s balance is zero.
```

## Signing and publishing a transaction

Sign and publish a transaction, calling the mint(address) function on the NFT contract you just deployed.

```bash
cast send <DEPLOYED_ADDRESS> --rpc-url=$BASE_SEPOLIA_RPC "mint(address)" <YOUR_ADDRESS_HERE> --account deployer
```

output
```
If successful, Foundry will respond with information about the transaction, including the blockNumber, gasUsed, and transactionHash
```

Confirm that it minted one NFT
```bash
cast call <DEPLOYED_ADDRESS> --rpc-url $BASE_SEPOLIA_RPC "balanceOf(address)" <YOUR_ADDRESS_HERE>
```

output is as follows:

```
And the response: 0x0000000000000000000000000000000000000000000000000000000000000001 (1 in hex) — congratulations, you deployed a contract and minted an NFT with Foundry!
```

# Foundry: Testing smart contracts

* Write and execute tests written in Solidity using the Forge Standard Library with Foundry
* Use the cheatcodes that Foundry provides to test your smart contracts
* Testing is a crucial aspect of smart contract development, ensuring the reliability and security of your code.
* It is impossible to patch a smart contract after deployment, you must thoroughly and completely test your code.
* Foundry provides a robust testing framework that allows developers to create comprehensive test suites for their projects using Solidity.

## Test with Foundry

Default test that the forge init hello_foundry_in_base command provides in the seed Foundry project.

```solidity
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
    }

    function testIncrement() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    function testSetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }
}
```






