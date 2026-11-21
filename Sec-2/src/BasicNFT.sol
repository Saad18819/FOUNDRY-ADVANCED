// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNFT is ERC721{ 
    uint256 private s_tokenCounter;
    mapping(uint256 tokenId =>string tokenUri) private s_tokenIdToUri;

constructor() ERC721("Dogie","DOG"){
s_tokenCounter = 0;
}
// coz erc721.sol has the constructor in it

function mintNFT(string memory tokenUri) public{
s_tokenIdToUri[s_tokenCounter] = tokenUri;
_safeMint(msg.sender,s_tokenCounter); // function in ERC721 token
s_tokenCounter++;
}

function tokenURI(uint256 tokenId) public view override returns(string memory){
  return s_tokenIdToUri[tokenId];
    
}
//this function already exist in the ERC721.sol so we just gonna override it coz its marked override over there 
// whenever u wanna look how ur nft looks like its this function that they are calling (explore openSEA)

}
// lesson 11 part 4 (IPFS)
/*
LEARNINGS

1. unique nft is a combination of the contract address which basically represents the collection and then the tokenID
2. URI(Uniform Resource Identifier) identifies the resource by name at the specified location or URL
3. consdier URI as an api call thats gonna return metadata for the NFT ( u can read more abt in ethereum.org NFT section)
4. in opensea u can actually see nft and when u do blockchain details which has the contract address and it redirects u to other website which has Tokenuri function name and when u paste that uri link u get the metadata 



You don't get a tokenURI from minting—you prepare the tokenURI first, and then pass it into the contract during minting so the blockchain knows what that NFT represents.

Think of the NFT like a physical parcel:

The Image (pug.png): The actual item inside the box. You upload this to IPFS first and get an image link.

The Metadata JSON (0-PUG.json): The shipping manifest describing the item (name, description, attributes, and the image link). You upload this JSON file to IPFS next—and that IPFS link is your tokenURI.

Minting (mintNft(PUG)): Creating the official ownership receipt on the blockchain and attaching that tokenURI label to Token ID #0.



this is the actual method:

Upload Image to IPFS -> Get the image URI (ipfs://.../pug.png).
Create & Upload Metadata JSON to IPFS -> Put that image URI inside a .json file (along with the name, description, and traits), 
upload the JSON to IPFS, and get the metadata URI.
This link is your tokenURI.
Deploy the Contract (DeployBasicNft.s.sol) Puts the empty->  NFT collection contract onto the blockchain (no tokenURI needed yet).
Mint the NFT (Interactions.s.sol) -> Calls mintNft(tokenURI) on that deployed contract to create Token ID #0 and permanently link it to that tokenURI.


 */