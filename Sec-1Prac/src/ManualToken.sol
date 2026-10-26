// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract ManualToken{

    mapping(address owner => uint256 balance) private balanceSheet;

   function name() public pure returns (string memory){
    return "Manual Token";
   }

   function symbol() public pure returns (string memory){
    return "ERC-20";
   }

   function decimals() public pure returns (uint8){
    return 18;
   }

   function totalSupply() public pure returns (uint256){
return 100 ether;
   }

function balanceOf(address _owner) public view returns (uint256 balance){
    return balanceSheet[_owner];
}

function transfer(address _to, uint256 _value) public returns (bool success){
    uint256 prevBalance = balanceSheet[msg.sender] + balanceSheet[_to];
    balanceSheet[msg.sender]-=_value;
    balanceSheet[_to] += _value;
    require(balanceSheet[msg.sender] + balanceSheet[_to] == prevBalance);
}



}
