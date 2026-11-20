// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {DeployBasicNft} from "../script/DeploybasicNft.s.sol";
import {BasicNFT} from "../src/BasicNFT.sol";

contract BasicNftTest is Test{

    DeployBasicNft public deployer;
    BasicNft public basicNft;

    function setUp() public{
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }


    function testNameIsCorrect() public{
string memory expectedName = "Dogie";
string memory actualName = basicNft.name() // name is a function in the ERC721.sol contract

// assert(expectedName == actualName) this is wrong coz u cant compare string bcoz string is an array of bytes and u dont compare array
// the stuff u can compare is uint256, bool , address bytes 
// we use loop generally for comparing the elements of array but this is a tedious task
// the method is eexplained down below


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
1.chisel



 */