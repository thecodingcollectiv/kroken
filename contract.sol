pragma solidity ^0.4.19;

contract WorkOrder {
	address public creator;
	address public worker;
	uint public creationTime;
	uint public amount;
	bool completed = false;
	
	modifier onlyBy(address _account) { require(msg.sender == _account); _;	}
	modifier notCompleted() { require(!completed); _; }
	modifier hasWorker() { require(worker != address(0)); _; }
	
	event workerPaidOut(uint amount, uint completedTime);
	event workorderCanceled(uint amount, uint canceledTime);
	event workerAdded(address worker, uint addedTime);

	function WorkOrder() public payable {
		amount = msg.value;
		creator = msg.sender;
		creationTime = now;
	}
	
	function addWorker(address workeraccount) onlyBy(creator) notCompleted public {
		worker = workeraccount;
		workerAdded(worker, now);
	}
	
	function payoutWorker() public onlyBy(creator) notCompleted hasWorker {
		completed = true;
		workerPaidOut(amount, now);
		worker.transfer(amount); //there might be trouble here
	}
	
	function cancel() public onlyBy(creator) notCompleted {
		completed = true;
		workorderCanceled(amount, now);
		creator.transfer(amount); //there might be trouble here
	}	
}
