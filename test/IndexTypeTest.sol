// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

contract ArrayContract{
    uint[] public data;//动态数组
    function updateData(uint[] memory newData) public {
        data = newData; //从memory到storage的赋值，创建了独立的拷贝
    }

    //返回storage中的data数组
    function getData() public view returns (uint[] memory) {
        return data; //返回storage中的的数据作为memory中的数组
    }

    function modifyStorageData(uint index,uint value) public{
        require(index < data.length,"index out of bounds");
        data[index] = value;//修改storage中的值，开销较大
    }

    function modifyMemoryData(uint[] memory memData) public pure returns (uint[] memory){
       
        if(memData.length > 0){
            memData[0] = 2;// 修改memory中的值，开销较小
        }
        return memData;
    }
}