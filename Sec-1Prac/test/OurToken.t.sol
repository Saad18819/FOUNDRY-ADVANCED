// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "forge-std/test.sol";
import {OurToken} from "../src/OurToken.t.sol";
import {DeployScript} from "../script/ManualTokenScript.s.sol";

contract codeTesting is Test{
OurToken public tokeyy;
DeployScript public depoy;

    function setUp() public{
depoy = new DeployScript();



    }
}