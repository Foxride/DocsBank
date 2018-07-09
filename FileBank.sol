pragma solidity ^0.4.24;

contract FileBank is Owner{
  mapping(uint128 => uint128) hashBase;
  uint128 fileCounter = 0;
  address fileBase;

  constructor(address _fileBase){
    owner = msg.sender;
    fileBase = _fileBase;
  }

  //Добавление файда в базу
  function addFile(uint128 _fileName, uint128 _fileHash) public onlyOwner returns(bool){
    require(hashBase[_fileName] != 0);
    hashBase[_fileName] = _fileHash;
    return true;
  }

  //Перезагрузка файла в базу
  function reloadFile(uint128 _fileName, uint128 _fileHash) public onlyOwner returns(bool){
    hashBase[_fileName] = _fileHash;
    return true;
  }

  //Проверка файла по хэшу
  function checkFile(uint128 _fileName, uint128 _fileHash) public returns(bool){
    require(msg.sender == fileBase);
    return (hashBase[_fileName] == _fileHash);
  }

  //Смена базы доступа
  function changeBase(address _newBase) public onlyOwner returns(bool){
    fileBase = _newBase;
  }
  
}
