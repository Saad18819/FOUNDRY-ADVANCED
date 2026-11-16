// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNFT is ERC721{ 
    uint256 private s_tokenCounter;

constructor() ERC721("Dogie","DOG"){
s_tokenCounter = 0;
}
// coz erc721.sol has the construcotr in it

function mintNFT() public{

}

}
// 5:00