as yet unclassified
renderDemo: html
	| visu debuggingVisu |
	self method
		ifNil: [ 
			visu := TLVisualization new.
			visu
				childrenProperty: [ :i | 
					{(i * 10).
					(i * 15)} ].
			visu addNodesFromEntities: #(1 2).
			visu styleSheet
				nodeLabel: #asString;
				expandCompositeNodes ]
		ifNotNil: [ visu := TLDemos executeDemo: self method ].
	debuggingVisu := TLDebuggingVisualizationTreeViewer visu: visu.
	visu
		addInteraction:
			((TLCustomWithParameterAction block: [ :aDrawable :aDroppedDrawable | aDroppedDrawable parentNode: aDrawable ])
				updateAlso: debuggingVisu) onDrop.
	html div
		id: 'view';
		with: [ 
					html render: ((TLCytoscapeComponent visualization: visu) style: 'height: 500px; width:800px;').
					html render: ((TLCytoscapeComponent visualization: debuggingVisu) style: 'height: 500px; width:800px;') ]