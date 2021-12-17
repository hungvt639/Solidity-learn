//SPDX-License-Identifier: Unlicense
pragma solidity >= 0.7.4 <0.9.0;
import "hardhat/console.sol";

contract Test {
   address public richest;
   uint public mostSent;

   mapping (address => uint) pendingWithdrawals;

   constructor() payable {
      richest = msg.sender;
      mostSent = msg.value;
   }
   function becomeRichest() public payable returns (bool) {
      if (msg.value > mostSent) {
        pendingWithdrawals[richest] += msg.value;
        richest = msg.sender;
        mostSent = msg.value;
        console.log("_true");
        return true;
      } else {
        console.log("_false");
        return false;
      }
   }
   function withdraw() public {
      uint amount = pendingWithdrawals[msg.sender];
      pendingWithdrawals[msg.sender] = 0;
      payable(msg.sender).transfer(amount);
   }
}