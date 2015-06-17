as yet unclassified
testDefaultCollapse
	| visu node action |
	visu := TLVisualization new.
	node := visu addNodeFromEntity: 4.
	visu generate.
	action:=(TLExpandCollapseNodesAction property: [ :n | 1 to: n - 1 ]).
	action actionOn: node.
	self assert: visu nodes size equals: 4.
	action actionOn: node.
	self assert: visu nodes size equals: 1.
	self assert: visu nodes first equals: node.