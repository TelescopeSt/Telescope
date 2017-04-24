demos
exampleConnectionStyle
	<script: 'self exampleConnectionStyle open'>
	<tlFilter: #style>
	<tlFilter: #group>
	| visualization lastNode |
	visualization := TLVisualization new.
	visualization layout gap: 150.
	(TLSimpleShape allSubclasses select: #availableForCytoscapeConnection)
		doWithIndex: [ :aShape :i | 
			| node1 node2 connection |
			node1 := visualization > #group1 addNodeFromEntity: i.
			node2 := visualization > #group2 addNodeFromEntity: i.
			connection := node1 connectTo: node2.
			connection styleSheet > #head shape: aShape.
			connection styleSheet
				connectionLabel: [ aShape asString ];
				connectionLabelSize: 10 ].
	lastNode := visualization > #group1 addNodeFromEntity: 'last'.
	(lastNode connectTo: (visualization > #group2 addNodeFromEntity: 'last')) styleSheet curveStyle: TLSegmentsCurve.
	visualization > #group1 layout: TLLinearLayout topToBottom.
	visualization > #group2 layout: TLLinearLayout topToBottom.
	^ visualization