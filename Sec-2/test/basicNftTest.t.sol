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
}