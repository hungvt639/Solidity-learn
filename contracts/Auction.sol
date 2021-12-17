//SPDX-License-Identifier: Unlicense
pragma solidity >= 0.7.4 <0.9.0;
import "hardhat/console.sol";

contract Auction {
    address payable public creator;
    uint public timeEnd;
    uint public maxValue;
    address public bindder;
    mapping(address => uint) listBinderValue;
    mapping (address => uint256) balanceOf;

    constructor(uint _timeEnd, address payable _creator){
        creator = _creator;
        timeEnd = block.timestamp + _timeEnd;
    }
    event newBinderAddMaxValue(address _binder, uint _value);
    event endBindding(address winder, uint value);



    // function Auction(uint256 initialSuppl) {
    //     balanceOf[msg.sender] = initialSupply;              // Give the creator all initial tokens
    // }



    function showValueFromAdd(address addr) public view{
        console.log("value of ", addr, " = ", listBinderValue[addr]);
    }
    
    function getBalence () public view{
        console.log("balance_",address(this).balance);
    }

    function getAddrSender()public view{
        console.log("addr_", msg.sender);
    }

    function getMoney() public view returns(uint256){
        return balanceOf[msg.sender];
    }

    function dauGia() public payable{
        console.log("dau gia");
        if(block.timestamp > timeEnd){
            revert("Thoi gian dau gia da ket thuc!");
        }
        if(msg.value <= maxValue){
            revert("Gia cua ban thap hon gia cao nhat");
        }
        console.log("value Dau Gia", msg.value);
        // console.log("b",address(this).balance);
        // if(msg.value > address(this).balance){
        //     revert("Ban khong du tien");
        // }
        bindder = msg.sender;
        maxValue = msg.value;
        listBinderValue[msg.sender] = msg.value;
        emit newBinderAddMaxValue(msg.sender, msg.value);
    }

    function rutTien() public returns(bool){
        if(msg.sender ==  bindder){
            // revert("Nguoi dat gia cao nhat khong duoc rut");
            return false;
        }
        uint value = listBinderValue[msg.sender];
        if(value < 0){
            // revert("Gia tri rut phai lon hon khong");
            return false;
        }
        if(!payable(msg.sender).send(value)){
            return false;            
        }
        listBinderValue[msg.sender] = 0;
        return true;
    }
    function ketThuc() public{
        if(block.timestamp < timeEnd){
            revert("Chua toi thoi gian ket thuc");
        }else{
            emit endBindding(bindder, maxValue);
            creator.transfer(maxValue);
        }
    }
}