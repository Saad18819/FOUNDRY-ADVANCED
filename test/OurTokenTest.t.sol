// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
import {Test} from "forge-std/Test.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";
import {OurToken} from "../src/OurToken.sol";
import {IERC20Errors} from "@openzeppelin/contracts/interfaces/draft-IERC6093.sol";

contract OurTokenTest is Test{

OurToken public tokeyy;
DeployOurToken public deployer;

address bob = makeAddr("BOB");
address alice = makeAddr("ALICE");
address charlie = makeAddr("CHARLIE");

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

// from here onwards the AI has written the test so we just gonna understand the code

function testInitialSupplyAndMetadata() public view {
        assertEq(tokeyy.totalSupply(), deployer.INITIAL_SUPPLY());
        assertEq(tokeyy.name(), "OurToken");
        assertEq(tokeyy.symbol(), "OT");
        assertEq(tokeyy.decimals(), 18);
    }

function testDirectTransfer() public {
        uint256 amount = 10 ether;

        vm.prank(bob);
        bool success = tokeyy.transfer(alice, amount);

        assertTrue(success);
        assertEq(tokeyy.balanceOf(alice), amount);
        assertEq(tokeyy.balanceOf(bob), STARTING_BALANCE - amount);
    }


function testRevertTransferInsufficientBalance() public {
        uint256 excessAmount = STARTING_BALANCE + 1 ether;

        vm.prank(bob);
        // Expect OpenZeppelin IERC6093 custom error for insufficient balance
        vm.expectRevert(
            abi.encodeWithSelector(
                IERC20Errors.ERC20InsufficientBalance.selector,
                bob,
                STARTING_BALANCE,
                excessAmount
            )
        );
        tokeyy.transfer(alice, excessAmount);
    }

    function testRevertTransferFromWithoutApproval() public {
        vm.prank(alice);
        vm.expectRevert(
            abi.encodeWithSelector(
                IERC20Errors.ERC20InsufficientAllowance.selector,
                alice,
                0,
                100
            )
        );
        tokeyy.transferFrom(bob, alice, 100);
    }

function testRevertTransferFromExceedingAllowance() public {
        uint256 allowance = 500;
        uint256 transferAmount = 600;

        vm.prank(bob);
        tokeyy.approve(alice, allowance);

        vm.prank(alice);
        vm.expectRevert(
            abi.encodeWithSelector(
                IERC20Errors.ERC20InsufficientAllowance.selector,
                alice,
                allowance,
                transferAmount
            )
        );
        tokeyy.transferFrom(bob, alice, transferAmount);
    }


function testRevertTransferToZeroAddress() public {
        vm.prank(bob);
        vm.expectRevert(
            abi.encodeWithSelector(
                IERC20Errors.ERC20InvalidReceiver.selector,
                address(0)
            )
        );
        tokeyy.transfer(address(0), 10 ether);
    }

    function testRevertApproveToZeroAddress() public {
        vm.prank(bob);
        vm.expectRevert(
            abi.encodeWithSelector(
                IERC20Errors.ERC20InvalidSpender.selector,
                address(0)
            )
        );
        tokeyy.approve(address(0), 100);
    }

}

/*

etherscan has this token approval stuff 



 */