action
actionOn: aNode
	(aNode state at: self actionPropertySymbol ifAbsentPut: [ false ])
		ifFalse: [ self connectNode: aNode ]
		ifTrue: [ self disconnectNode: aNode ].
	aNode requireUpdateAndLayoutApplication