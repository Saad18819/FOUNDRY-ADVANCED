// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {DeployBasicNft} from "../script/DeploybasicNft.s.sol";
import {BasicNFT} from "../src/BasicNFT.sol";

contract BasicNftTest is Test{

    DeployBasicNft public deployer;
    BasicNFT public basicNft;

    address public saad = makeAddr("Saad");
    string public constant PUG = "ipfs://bafybeig37i6ir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
// got this url from github repo of the course


    function setUp() public{
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }


    function testNameIsCorrect() public view{
string memory expectedName = "Dogie";
string memory actualName = basicNft.name(); // name is a function in the ERC721.sol contract to get the name of the contract

// assert(expectedName == actualName) this is wrong coz u cant compare string bcoz string is an array of bytes and u dont compare array
// the stuff u can compare is uint256, bool , address bytes32
// we use loop generally for comparing the elements of array but this is a tedious task
// the method is eexplained down below

assert(keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)));

    }


 // lesson 11 part 7 

function testCanMintAndHaveBalance() public{

vm.prank(saad);
basicNft.mintNFT(PUG);

assert(basicNft.balanceOf(saad)==1);  // balanceOf(address) returns the total count (number) of NFTs owned by that address within that specific ERC-721 contract.
assert(keccak256(abi.encodePacked(PUG)) == keccak256(abi.encodePacked(basicNft.tokenURI(0)))); 


}

}




/*
HOW TO COMPARE TWO STRINGS

n Solidity, you cannot compare two strings directly using the == operator. Instead, you must compare their cryptographic hashes using keccak256 after encoding them into bytes.
Example: keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b))

abi.encodePacked(a): Converts the string into a tightly packed bytes array. Because keccak256 only accepts bytes as an argument, this conversion is required.

keccak256(...): Generates a unique, fixed-size 32-byte hash (bytes32) for each byte array.

== Comparison: While Solidity does not support == on dynamic types like string or bytes, it natively supports == on fixed-size value types like bytes32.

and for all of this the best method is to use chisel (explanation is given below)


saad@Saad:/mnt/c/Foundry Advanced/Sec-2$ chisel
Welcome to Chisel! Type `!help` to show available commands.
➜ string memory cat = "cat";
➜ string memory dog = "dog";
➜ cat
Type: string
├ UTF-8: cat
├ Hex (Memory):
├─ Length ([0x00:0x20]): 0x0000000000000000000000000000000000000000000000000000000000000003
├─ Contents ([0x20:..]): 0x6361740000000000000000000000000000000000000000000000000000000000
├ Hex (Tuple Encoded):
├─ Pointer ([0x00:0x20]): 0x0000000000000000000000000000000000000000000000000000000000000020
├─ Length ([0x20:0x40]): 0x0000000000000000000000000000000000000000000000000000000000000003
└─ Contents ([0x40:..]): 0x6361740000000000000000000000000000000000000000000000000000000000

➜ bytes memory encodedCat = abi.encodePacked(cat);
➜ encodedCat
Type: dynamic bytes
├ Hex (Memory):
├─ Length ([0x00:0x20]): 0x0000000000000000000000000000000000000000000000000000000000000003
├─ Contents ([0x20:..]): 0x6361740000000000000000000000000000000000000000000000000000000000
├ Hex (Tuple Encoded):
├─ Pointer ([0x00:0x20]): 0x0000000000000000000000000000000000000000000000000000000000000020
├─ Length ([0x20:0x40]): 0x0000000000000000000000000000000000000000000000000000000000000003
└─ Contents ([0x40:..]): 0x6361740000000000000000000000000000000000000000000000000000000000
➜ bytes32 catHash = keccak256(encodedCat);
➜ catHash
Type: bytes32
└ Data: 0x52763589e772702fa7977a28b3cfb6ca534f0208a2b2d55f7558af664eac478a


 */