as yet unclassified
expandNode: aNode
	| children |
	children := self property rtValue: aNode entity.
	aNode connectToAll: (self parentToChildren
		at: aNode
		put: (children ifNotNil: [ (self destinationGroupFrom: aNode) addNodesFromEntities: children ])).
	aNode state at: #expanded put: true