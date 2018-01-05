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
	
	function cancel() public onlyBy(creator) {
		//transfer the money in this workorder back to the creator.
	}	
}
