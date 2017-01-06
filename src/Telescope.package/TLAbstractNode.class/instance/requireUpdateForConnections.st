state
requireUpdateForConnections
	"If i have no parent, no layouting required"

	self parent ifNil: [ ^ self requireUpdate ].
	self parent layout isConnectionDependant
		ifTrue: [ self requireUpdateAndLayoutApplication ]
		ifFalse: [ self requireUpdate ]