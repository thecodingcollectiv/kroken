# kroken

A workerorder is a contract between two people, the creator and the worker.
The creator stores x amount of wei in the contract at creation.

The worker receives this amount when the creator accepts the work that has been done by the worker.


#### Technical
A WorkOrder can be created by calling it's constructor with a certain amount of wei.
The person creating the workorder is the creator.

The creator can then add a worker to the wororder by calling addWorker(address workeraccount).

The creator can then pay the worker and sent over the amount of way stored in the contract by calling payoutWorker(). OR cancel the workorder in which case the amount of wei stored in the contract is returned to the creator.

*Notes*
After creating the workorder it can immediatly be canceled by the creator.
After adding a worker, this worker can be overwritten by the creator with another simple by calling the addWorker method again with another address.
