updating - connection
updateAllConnections
	self flag: 'we should not access trachelShape pushFront at thie level but in Roassal2Connector'.
	self shapeByDrawable copy
		keysDo: [ :drawable | 
			drawable isConnection
				ifTrue: [ 
					((drawable fromNode isNil or: [ drawable toNode isNil ]) or: [ drawable isVisible not ])
						ifTrue: [ self removeConnection: drawable ] ifFalse: [ drawable updateWith: self ] ] ]