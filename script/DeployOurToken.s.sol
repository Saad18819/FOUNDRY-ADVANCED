// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
import {Script} from "forge-std/Script.sol";
import {OurToken} from "../src/OurToken.sol";

// important note we dont need helperconfig here coz no matter what chain we deploy the logic will remain same


contract DeployOurToken is Script{
function run() external{
vm.startBroadcast();

}
}