pragma solidity ^0.4.24;
import "./BaseInterface.sol"

contract Bank{

    address bank;
    BaseInterface Base;

    function setBaseInterface(){
      Base = BaseInterface(bank);
    }
}
