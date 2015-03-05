accessing
findRootNodesFromTightTree: aTightTree
	| allFroms |
	allFroms := aTightTree collectAsSet: [ :aConnection | aConnection fromNode ].
	^ allFroms reject: [ :aNode | aTightTree anySatisfy: [ :aConnection | aConnection toNode = aNode ] ]