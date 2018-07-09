pragma solidity ^0.4.24;

contract Owner{
    address owner;

    modifier onlyOwner(){
        require(owner == msg.sender);
        _;
    }

    //Возвращает владельца
    function getOwner() view public returns(address){
        return owner;
    }

    //Смена владельца
    function changeOwner(address _newOwner) public onlyOwner returns(bool){
      owner = _newOwner;
      return true;
    }

}
