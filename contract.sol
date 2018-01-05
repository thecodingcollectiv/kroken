pragma solidity ^0.4.19;

contract WorkOrder {
	address public creator;
	address public worker;
	uint public creationTime;
	uint public amount;
	bool completed = false;
	
	modifier onlyBy(address _account) { require(msg.sender == _account); _;	}
	modifier notCompleted() { require(!completed); _; }
	modified hasWorker() { require(worker != address(0)); _; }

	function WorkOrder() public payable {
		amount = msg.value;
		creator = msg.sender;
		creationTime = now;
	}
	
	function addWorker(address workeraccount) public {
		worker = workeraccount;
	}
	
	function cancel() public onlyBy(creator) notCompleted {
		completed = true;
		creator.transfer(amount);
	}	
}