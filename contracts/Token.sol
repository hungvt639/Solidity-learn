//SPDX-License-Identifier: Unlicense
pragma solidity >= 0.7.4 <0.9.0;
import "hardhat/console.sol";

// This is the main building block for smart contracts.
contract Token {
    string public name = "My Hardhat Token";
    string public symbol = "MHT";

    uint256 public totalSupply = 1000000;

    address public owner;

    mapping(address => uint256) balances;


    constructor() {
        balances[msg.sender] = totalSupply;
        owner = msg.sender;
    }


    function transfer(address to, uint256 amount) external {
        require(balances[msg.sender] >= amount, "Not enough tokens");

        balances[msg.sender] -= amount;
        balances[to] += amount;
    }


    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }
}