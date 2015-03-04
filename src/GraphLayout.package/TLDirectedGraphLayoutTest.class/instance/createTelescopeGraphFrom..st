as yet unclassified
createTelescopeGraphFrom: aCollectionOfAssociations
	| nodesGroup |
	nodesGroup := TLEntitiesGroup new.
	nodesGroup nodeBuilder: (TLNodeBuilder new).
	nodesGroup edgeBuilder: (TLEdgeBuilder new).
	nodesGroup addAbsentNodesInVisualizationFromEntities: (aCollectionOfAssociations collect: #key) asSet.
	nodesGroup addAbsentNodesInVisualizationFromEntities: (aCollectionOfAssociations collect: #value) asSet.
	aCollectionOfAssociations
		do: [ :assoc | (nodesGroup nodeForEntity: assoc key) connectTo: (nodesGroup nodeForEntity: assoc value) ].
	^ nodesGroup