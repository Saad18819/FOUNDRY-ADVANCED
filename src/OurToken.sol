// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OurToken is ERC20{
constructor(uint256 initialSupply) ERC20("OurToken","OT"){
    _mint(msg.sender, initialSupply); // from erc 20 itself
}
// coz ERC20 has a constructor and whenever u inherit constructor u know u have to add the constructor here itself

}

/*

STEPS:
1. install openzeppelin contracts  "forge install openzepplin/openzeppelin-contracts@version"
for version just check course ka github repo ka makeFile for the latest version
2. make sure do write the crct path in remappings






LEARNING
1.okay here we will be using a already deployed,audited erc-20 contract and 
one of the most popular framework out there is OpenZeppelin contracts
they have ton of contracts which we can copy paste and use
2.We have imported ERC 20 token alright



 */