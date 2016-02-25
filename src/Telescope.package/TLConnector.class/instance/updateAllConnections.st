updating - connection
updateAllConnections
	self shapeByDrawable copy
		keysDo: [ :drawable | 
			drawable isConnection
				ifTrue: [ 
					((drawable fromNode isNil or: [ drawable toNode isNil ]) or: [ drawable isVisible not ])
						ifTrue: [ self removeConnection: drawable ] ifFalse: [ drawable updateWith: self ] ] ]