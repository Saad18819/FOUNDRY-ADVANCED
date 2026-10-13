// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

/*
Note that when writing an ERC-20 contract u gotta refer to ERC-20 Token Standard stufff
the rules and regulations they have alrady provided u just stick to it

 */

contract ManualToken{

mapping(address => uint256) s_balances;
/* 
if u see someones balance is just some mapping in this token contract
like lets say if i have 10 tokens in this mapping so it will be just my address is assigned to 10 tokens right
so holding tokens of an ERC-20 just means you have some  balance in some mapping in the contract
*/ 

function name() public pure returns (string memory){
    return "Manual Token";
}

// alternative of above function is
 // string public name = "Manual Token";

function decimals() public pure returns(uint8){
    return 18;
}

function totalSupply() public pure returns(uint256){

return 100 ether; // 100 * 1e18

} 

function balanceOf(address _owner) public pure returns (uint256){

return s_balances[_owner];


}

function transfer(address _to, uint256 _value) public returns (bool success){
    uint256 previousBalance = balanceOf(msg.sender) + balanceOf(_to);
    balanceOf(_from) -= _value;
  balanceOf(_to) += _value;
  require(balanceOf[_from] + balanceOf[_to] == previousBalances);
}


}