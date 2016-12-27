state
requireUpdateForConnections
	self visualization layout isConnectionDependant
		ifTrue: [ self requireUpdateAndLayoutApplication ]
		ifFalse: [ self requireUpdate ]