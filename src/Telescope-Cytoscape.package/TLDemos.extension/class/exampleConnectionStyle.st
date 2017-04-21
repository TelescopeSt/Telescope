*Telescope-Cytoscape
exampleConnectionStyle
	<script: 'self exampleConnectionStyle open'>
	<tlFilter: #style>
	<tlFilter: #group>
	| visualization lastNode |
	visualization := TLVisualization new layout: (TLLinearLayout gap: 150).
	(TLSimpleShape allSubclasses select: #availableForCytoscapeConnection)
		doWithIndex: [ :aShape :i | 
			| node1 node2 |
			node1 := visualization > #group1 addNodeFromEntity: i.
			node2 := visualization > #group2 addNodeFromEntity: i.
			(node1 connectTo: node2) styleSheet > #head shape: aShape ].
	lastNode := visualization > #group1 addNodeFromEntity: 'last'.
	(lastNode connectTo: (visualization > #group2 addNodeFromEntity: 'last')) styleSheet curveStyle: TLSegmentsCurve.
	visualization > #group1 layout: TLLinearLayout topToBottom.
	visualization > #group2 layout: TLLinearLayout topToBottom.
	^ visualization