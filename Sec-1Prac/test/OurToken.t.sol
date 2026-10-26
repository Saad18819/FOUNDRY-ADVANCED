// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "forge-std/test.sol";
import {OurToken} from "../src/OurToken.t.sol";
import {DeployScript} from "../script/ManualTokenScript.s.sol";

contract codeTesting is Test{
OurToken public tokeyy;
DeployScript public depoy;

address saad = makeAddr("SAAD");
address zid = makeAddr("ZID");
uint256 Supply = 100 ether;

    function setUp() public{
depoy = new DeployScript();
tokeyy = depoy.run();

vm.prank(msg.sender);
tokeyy.transfer(saad,Supply);
}

function testApprove() public{
uint256 transferAmnt = 50 ether;
uint256 maxLimit = 100 ether;

vm.prank(saad);
tokeyy.approve(zid,maxLimit);

vm.prank(zid);
tokeyy.transferFrom(saad,zid,transferAmnt);

assert(balanceOf(saad) , balanceOf(zid));
}


}