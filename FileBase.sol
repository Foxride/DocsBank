pragma solidity ^0.4.24;

contract FileBase is Owner, Base{

  mapping(address => mapping(address => mapping(uint128 => bool))) accessBase;

  constructor(address _fileBank){
    bank = _fileBank;
    owner = msg.sender;
    setBaseInterface();
  }

  //Запрос доступа к файлу
  function addRequest(uint128 _file, address _owner) public returns(bool){
    accessBase[_owner].[_msg.sender][_file] = false;
    return true;
  }

  //Разрешение доступа к файлу
  function acceptRequest(uint128 _file, address _company) public returns(bool){
    require(accessBase[_msg.sender].[_owner].[_file] == false); //Проверка наличия запоса
    accessBase[_msg.sender].[_owner].[_file] == true;
    return true;
  }

  //Запрет доступа к файлу
  function deleteAcceptRequest(uint128 _file, address _company) public returns(bool){
    require(accessBase[_msg.sender].[_owner].[_file] == true); //Проверка наличия запоса
    accessBase[_msg.sender].[_owner].[_file] == false;
    return true;
  }

  //Просмотр доступа к файлу
  function watchAccept(uint128 _file, address _owner) public view returns(bool){
    return accessBase[_owner].[msg.sender].[_file];
  }

  //Смена базы
  function changeBase(address _newBase) public onlyOwner returns(bool){
    fileBase = _newBase;
  }

  //Проверка достоверности файла
  function checkFile(address _owner, uint128 _fileName, uint128 _fileHash) public returns(bool){
    require(watchAccept(_fileName, _owner));

  }
}
