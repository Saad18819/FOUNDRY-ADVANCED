// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
import {Script} from "forge-std/Script.sol";
import {OurToken} from "../src/OurToken.sol";

// important note we dont need helperconfig here coz no matter what chain we deploy the logic/smart contract will remain same


contract DeployOurToken is Script{

    uint256 public constant INITIAL_SUPPLY = 1000 ether;

function run() external returns(OurToken){

vm.startBroadcast();
OurToken ot = new OurToken(INITIAL_SUPPLY);
vm.stopBroadcast();
return ot;
}

}

/*
STEP FOR DEPLOYMENT
1. "make anvil"  do it in the diff terminal
2."make deploy"



 */


/*
LEARNING

1. When HelperConfig IS Needed
You use a HelperConfig script when your deployment depends on contracts or addresses that change from chain to chain, such as:

Chainlink Price Feeds (e.g., ETH/USD aggregator address is different on Anvil, Sepolia, and Mainnet).
Chainlink VRF Coordinators / Key Hashes.
Mock Contracts (where you need to deploy a mock contract on Anvil, but use a real deployed contract address on Sepolia/Mainnet).




. Why OurToken DOES NOT Need It As noted in your code comment:  
Self-Contained Logic: OurToken is a plain ERC-20 token built using OpenZeppelin standards. It only needs an INITIAL_SUPPLY passed to its constructor (new OurToken(INITIAL_SUPPLY)).  
Identical Across Chains: Whether you deploy to Anvil, Sepolia, Arbitrum, or Mainnet, the token deployment parameters and initial supply stay identical.  
No External System Contracts: It does not call any pre-existing external protocol, oracle, or factory contract on the host chain.






 */