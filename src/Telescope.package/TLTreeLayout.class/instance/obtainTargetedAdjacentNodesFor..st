private
obtainTargetedAdjacentNodesFor: aNode
	^ self incomingUsed
		ifTrue: [ aNode incomingAdjacentNodes ]
		ifFalse: [ aNode outgoingAdjacentNodes ]