pragma solidity ^0.4.19;

contract WorkOrder {
  address public creator = new msg.sender;	
	uint public creationTime = now;
  bool completed = false;
  
	modifier onlyBy(address _account)
  {
      require(msg.sender == _account);
      _;
  }
}
