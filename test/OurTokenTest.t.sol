// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
import {Test} from "forge-std/Test.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";
import {OurToken} from "../src/OurToken.sol";

contract OurTokenTest is Test{

OurToken pubic tokeyy;
DeployOurToken public deployer;

address

function setUp() public{
    deployer = new DeployOurToken();
    tokeyy = deployer.run();
}




}
