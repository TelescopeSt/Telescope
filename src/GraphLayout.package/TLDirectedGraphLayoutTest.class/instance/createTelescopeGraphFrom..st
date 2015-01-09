as yet unclassified
createTelescopeGraphFrom: aCollectionOfAssociations
	| nodesGroup |
	nodesGroup := TLEntitiesGroup new.
	nodesGroup nodeBuilder: (TLNodeBuilder new).
	nodesGroup edgeBuilder: (TLEdgeBuilder new).
	nodesGroup addAbsentNodesInVisualizationFromEntities: (aCollectionOfAssociations collect: #key) asSet.
	nodesGroup addAbsentNodesInVisualizationFromEntities: (aCollectionOfAssociations collect: #value) asSet.
	aCollectionOfAssociations
		do: [ :assoc | (nodesGroup nodeFromEntity: assoc key) connectTo: (nodesGroup nodeFromEntity: assoc value) ].
	^ nodesGroup