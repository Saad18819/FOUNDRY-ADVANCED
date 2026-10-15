// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OurToken is ERC20{
constructor(uint256 initialSupply) ERC20("OurToken","OT"){
    _mint(msg.sender, initialSupply);
}
}

/*

STEPS:







LEARNING
okay here we will be using a already deployed,audited erc-20 contract and 
one of the most popular framework out there is OpenZeppelin contracts
they have ton of contracts which we can copy paste and use



 */