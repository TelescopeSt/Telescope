as yet unclassified
lowestLevelNodes
	|lowestLevelNodes|
	lowestLevelNodes := self childrenNodes reject: #hasChildren.
	^ (lowestLevelNodes, (self childrenNodes flatCollect: #lowestLevelNodes))