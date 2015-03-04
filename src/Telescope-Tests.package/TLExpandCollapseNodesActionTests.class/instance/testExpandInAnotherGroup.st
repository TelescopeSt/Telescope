as yet unclassified
testExpandInAnotherGroup
	| visu node |
	visu := TLVisualization new.
	node := visu addNodeFromEntity: 4.
	visu generate.
	(TLExpandCollapseNodesAction property: [ :n | 1 to: n - 1 ] destinationGroup: visu > #childGroup) actionOn: node.
	self assert: visu nodes asArray equals: {node}.
	self assert: (visu > #childGroup) size equals: 3.
	self assert: node outgoingConnections size equals: 3.
	self assert: (node outgoingConnections collect: #toNode) equals: (visu > #childGroup) telescopeEntities