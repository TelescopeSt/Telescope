*Telescope-Cytoscape
exampleConnectionStyle
	<script: 'self exampleConnectionStyle open'>
	<tlFilter: #style>
	<tlFilter: #group>
	| visualization firstNode |
	visualization := TLVisualization new layout: (TLLinearLayout gap: 150).
	(TLSimpleShape allSubclasses select: #availableForCytoscapeConnection)
		doWithIndex: [ :aShape :i | 
			firstNode := visualization > #group1 addNodeFromEntity: 'first'.
			((visualization > #group1 addNodeFromEntity: i) connectTo: (visualization > #group2 addNodeFromEntity: i)) styleSheet
				> #head shape: aShape ].
	(firstNode connectTo: (visualization > #group2 addNodeFromEntity: 'last')) styleSheet curveStyle: TLSegmentsCurve.
	visualization > #group1 layout: TLLinearLayout topToBottom.
	visualization > #group2 layout: TLLinearLayout topToBottom.
	^ visualization