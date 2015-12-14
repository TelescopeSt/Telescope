*Telescope-Cytoscape
exampleConnectionStyle
	<script: 'self exampleConnectionStyle open'>
	| visualization firstNode |
	visualization := TLVisualization new.
	(TLSimpleShape allSubclasses select: #availableForCytoscapeConnection)
		doWithIndex: [ :aShape :i | 
			firstNode := visualization > #group1 addNodeFromEntity: 'first'.
			((visualization > #group1 addNodeFromEntity: i) connectTo: (visualization > #group2 addNodeFromEntity: i)) styleSheet
				> #head shape: aShape ].
	(firstNode connectTo: (visualization > #group2 addNodeFromEntity: 'last')) styleSheet curveStyle: TLSegmentsCurve.
	visualization > #group1 layout: RTVerticalLineLayout.
	visualization > #group2 layout: RTVerticalLineLayout.
	^ visualization