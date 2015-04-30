as yet unclassified
testAdjacentPositionsForNodeWithRankNodes

	| graph cNode |
	graph := (self createTelescopeGraphFrom: self graph1).
	cNode := graph nodeForEntity: $c.
	self assert: (layout adjacentPositionsForNode: cNode withRankNodes: (graph nodesForEntities: #($e $f $b))) asArray equals: #(3)