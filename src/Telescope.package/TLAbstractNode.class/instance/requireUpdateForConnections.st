state
requireUpdateForConnections
	self parent layout isConnectionDependant
		ifTrue: [ self requireUpdateAndLayoutApplication ]
		ifFalse: [ self requireUpdate ]