// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
import {Test} from "forge-std/Test.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";
import {OurToken} from "../src/OurToken.sol";

contract OurTokenTest is Test{

OurToken public tokeyy;
DeployOurToken public deployer;

address bob = makeAddr("BOB");
address alice = makeAddr("ALICE");

uint256 public constant STARTING_BALANCE = 100 ether;

function setUp() public{
    deployer = new DeployOurToken();
    tokeyy = deployer.run();

vm.prank(msg.sender);
tokeyy.transfer(bob,STARTING_BALANCE);

}

function testBobBalance() public{
    assertEq(STARTING_BALANCE , tokeyy.balanceOf(bob));
}

function testAllowances() public{
    // transferFrom is used to withdraw workflow allowing contracts to transfer tokens on ur behalf
    uint256 initialAllowance = 1000;

    // bob approves alice to spend tokens on his behalf

vm.prank(bob);
tokeyy.approve(alice,initialAllowance);  // inside oppenzepplin erc-20 has a approve function

uint256 transferAmount = 500;

vm.prank(alice);
tokeyy.transferFrom(bob,alice,transferAmount);
assertEq(tokeyy.balanceOf(alice), transferAmount);
assertEq(tokeyy.balanceOf(bob), STARTING_BALANCE - transferAmount);

}


}

/*

etherscan has this token approval stuff 



 */