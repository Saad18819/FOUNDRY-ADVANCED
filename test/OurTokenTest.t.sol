// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
import {Test} from "forge-std/Test.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";
import {OurToken} from "../src/OurToken.sol";

contract OurTokenTest is Test{

OurToken pubic tokeyy;
DeployOurToken public deployer;

address bob = makeAddr("BOB");
address alice = makeAddr("ALICE");

uint256 public constant STARTING_BALANCE = 100 ether;

function setUp() public{
    deployer = new DeployOurToken();
    tokeyy = deployer.run();

vm.prank(address(deployer));
ourToken.transfer(bob,STARTING_BALANCE);

}

function testBobBalance() public{
    
}



}
