//SPDX-License-Identifier: Unlicense
pragma solidity >= 0.7.4 <0.9.0;
import "hardhat/console.sol";

contract Coin {
    address public miner;
    mapping (address => uint) public balance;

    constructor () {
        miner = msg.sender;
        console.log("miner_", miner);

    }
    modifier onlyMiner{
        require (msg.sender == miner);
        _;
    }
    event sent(address from, address to, uint val);

    function mint(address rec, uint amount) public onlyMiner{
        require (amount < 1e60);
        balance[rec] += amount;
        console.log("add money ok");
    }
    function getSender() public view {
        console.log("Sender is: ", msg.sender);
    }
    function send(address to, uint value) public onlyMiner{
        require (balance[msg.sender]>=value, "Khong du tien");
        balance[msg.sender] -= value;
        balance[to] += value;
        emit sent(msg.sender, to, value);
        console.log("send money ok");

    }
    function getCoin(address add) public view returns(uint){
        console.log("get money to", add);
        return balance[add];
    }
}