// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {BasicNFT} from "../src/BasicNFT.sol";

contract MintBasicNft is Script{

string public constant PUG =
    "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    // get it from cyfrin code

 function run() external{
address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("BasicNFT",block.chainid);
mintNftOnContract(mostRecentlyDeployed);
 }

// we will be working with most recently deployed NFT so we will install foundry devops package
// "forge install Cyfrin/foundry-devops"

function mintNftOnContract(address contractAddress) public{

vm.startBroadcast();
BasicNFT(contractAddress).mintNFT(PUG);
vm.stopBroadcast();

}

}

/*

LEARNING

Think of Interactions.s.sol as a remote control for your smart contract.


BasicNFT.sol is the TV (the smart contract itself, sitting on the blockchain).
DeployBasicNft.s.sol is the delivery person who puts the TV on the wall and plugs it in.
Once the TV is on the wall, it doesn't do anything by itself—it just sits there empty with 0 NFTs minted. 
Interactions.s.sol is the remote control you press to actually use the TV (in this case, calling mintNft to create your Pug NFT).



What is Interactions.s.sol actually doing step-by-step?

When you run Interactions.s.sol in your terminal, it performs three simple actions:
Finds your contract: Because you didn't hardcode the contract's address (0x123...), 
DevOpsTools looks into Foundry's deployment history folder (broadcast/), finds the address of the BasicNFT you just deployed, and saves it into mostRecentlyDeployed.
Connects to it: BasicNFT(mostRecentlyDeployed) tells Solidity, 
"There is a BasicNFT contract living at this exact address on the blockchain."Sends a real transaction:
 Between vm.startBroadcast() and vm.stopBroadcast(), it calls .mintNft(PUG). 
 This spends a tiny bit of gas and permanently mints the Pug NFT onto that deployed contract.
 
 
 Why do we need it? (Couldn't we just do this without the file?)
 Yes, you could mint without Interactions.s.sol, but here is what you would have to do instead:
 
 The Painful Way (Without Interactions.s.sol):
 Deploy your contract.
 Scroll through your terminal logs to find and copy the new contract address (0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0).
 Type a massive command in your terminal by hand:

cast send 0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0 "mintNft(string)" "ipfs://bafybeig37i6ir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json" --private-key 0x...

Every time you restart Anvil or deploy to Sepolia, you get a new address, so you have to copy-paste and edit that huge command all over again.




The Easy Way (With Interactions.s.sol):
You just run one short command:

forge script script/Interactions.s.sol --rpc-url ... --broadcast

It automatically finds the new address, grabs the IPFS link, and mints the NFT for you every single time without you touching any addresses. 
Plus, your test file (basicNftTest.t.sol) can also run this exact same script to make sure your minting workflow works properly before you spend real money on a live network.





 */


