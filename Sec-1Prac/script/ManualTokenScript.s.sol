// SPDX-License-Identifier:MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {OurToken} from "../src/OurToken.sol";

contract DeployScript is Script{

uint256 Supply = 100 ether;

    function run() external returns(OurToken){
        vm.startBroadcast();
        OurToken ot = new OurToken(Supply);
        vm.stopBroadcast();
        return ot;
    }
    
}