// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract UserPoints{

    address[] public userAddresses;
    mapping (address=> uint) public userPoints;

    //添加新用户
    function addUser(address _address) public{
        require(userPoints[_address] == 0,"user already exist");
        userAddresses.push(_address);
        userPoints[_address] = 100;
    }

    function transferPoints(address _to, uint _amount) public
 {
        require(userPoints[msg.sender] >= _amount, "Insufficient points.");
        userPoints[msg.sender] -= _amount;
        userPoints[_to] += _amount;
    }

    function getAllUsers() public view returns (address[] memory) {
        return userAddresses;
    }



}