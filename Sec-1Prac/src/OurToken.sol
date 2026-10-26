// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OurToken is ERC20{

    constructor(uint256 Supply) ERC20("OURTOKEN" ,"OT"){
        _mint(msg.sender ,Supply);
    }

}