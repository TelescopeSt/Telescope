as yet unclassified
testDefaultExpand
	| node |
	node := visu addNodeFromEntity: 4.
	visu generate.
	(TLExpandCollapseNodesAction property: [ :n | 1 to: n - 1 ]) actionOn: node.
	self assert: visu nodes size equals: 4.
