accessing
getNodesFrom: aNode ignoring: cutEdge tightTree: tightTreeConnections
	^ {aNode}
		,
			((aNode allConnections
				reject: [ :aConnection | aConnection = cutEdge or: [ (tightTreeConnections includes: aConnection) not ] ])
		flatCollect: [ :aConnection | 
			self
				getNodesFrom:
					(aConnection fromNode = aNode
						ifTrue: [ aConnection toNode ]
						ifFalse: [ aConnection fromNode ])
				ignoring: aConnection
				tightTree: tightTreeConnections ])