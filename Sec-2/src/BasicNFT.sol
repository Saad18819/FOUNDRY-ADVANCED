// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNFT is ERC721{ 
    uint256 private s_tokenCounter;

constructor() ERC721("Dogie","DOG"){
s_tokenCounter = 0;
}
// coz erc721.sol has the constructor in it

function mintNFT() public{

}

function tokenURI(){}

//this function already exist in the ERC721.sol so we just gonna override it coz its marked override over there 

}

/*
LEARNINGS

1. unique nft is a combination of the contract address which basically represents the collection and then the tokenID
2. URI(Uniform Resource Identifier) identifies the resource by name at the specified location or URL
3. consdier URI as an api call thats gonna return metadata for the NFT ( u can read more abt in ethereum.org NFT section)


 */