as yet unclassified
expandNode: aNode
	| children |
	children := self property rtValue: aNode entity.
	self parentToChildren at: aNode put: (children ifNotNil: [ aNode parent addNodesFromEntities: children ]).
	aNode parent connectInsideGroupEntities: { aNode entity } to: (children).
	aNode state at: #expanded put: true.