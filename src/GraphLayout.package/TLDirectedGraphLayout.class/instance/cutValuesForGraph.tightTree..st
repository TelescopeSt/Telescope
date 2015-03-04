accessing
cutValuesForGraph: aGraph tightTree: tightTreeConnections
	^ (tightTreeConnections
		collect: [ :aConnection | 
			|head tail|
			head := self getNodesFrom: aConnection fromNode ignoring: aConnection tightTree: tightTreeConnections.
			tail := self getNodesFrom: aConnection toNode ignoring: aConnection tightTree: tightTreeConnections.
			aConnection -> (self computeCutValueHead: head tail: tail) ]) asDictionary 