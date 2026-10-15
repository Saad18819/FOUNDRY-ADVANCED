// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
import {Script} from "forge-std/Script.sol";
import {OurToken} from "../src/OurToken.sol";

// important note we dont need helperconfig here coz no matter what chain we deploy the logic will remain same


contract DeployOurToken is Script{

    uint256 public constant INITIAL_SUPPLY = 1000 ether;
    
function run() external{

vm.startBroadcast();
new OurToken()

}
}