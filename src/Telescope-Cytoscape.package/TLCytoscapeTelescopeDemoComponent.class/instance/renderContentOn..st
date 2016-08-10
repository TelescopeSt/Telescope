as yet unclassified
renderContentOn: html
	| visu debuggingVisu |
	visu := TLVisualization new.
	visu
		childrenProperty: [ :i | 
			{(i * 10).
			(i * 15)} ].
	visu addNodesFromEntities: #(1 2).
	visu styleSheet
		nodeLabel: #asString;
		expandCompositeNodes.
	debuggingVisu := TLDebuggingVisualizationTreeViewer visu: visu.
	visu
		addInteraction:
			((TLCustomWithParameterAction block: [ :aDrawable :aDroppedDrawable | aDroppedDrawable parentNode: aDrawable ])
				updateAlso: debuggingVisu) onDrop.
	html render: ((TLCytoscapeComponent visualization: visu) style: 'height: 500px; width:800px;').
	html render: ((TLCytoscapeComponent visualization: debuggingVisu) style: 'height: 500px; width:800px;')