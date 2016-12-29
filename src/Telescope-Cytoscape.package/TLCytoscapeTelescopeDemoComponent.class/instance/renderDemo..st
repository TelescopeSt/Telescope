as yet unclassified
renderDemo: html
	| visu debuggingVisu  visuId |
	visuId := TLCytoscapeComponent generateId.
	self method ifNil: [ visu := self defaultDemo ] ifNotNil: [ visu := TLDemos executeDemo: self method ].
	debuggingVisu := TLDebuggingVisualizationTreeViewer visu: visu.
	visu addInteraction: (self externalTriggerExemple: html onVisu: visuId).
	visu addInteraction: (self drillDownAction: html onVisu: visuId).
	visu
		addInteraction:
			((TLCustomWithParameterAction block: [ :aDrawable :aDroppedDrawable | aDroppedDrawable parentNode: aDrawable ])
				updateAlso: debuggingVisu) onDrop.
					html render: ((TLCytoscapeComponent visualization: visu id: visuId) style: 'height: 500px; width:800px;').
					html render: ((TLCytoscapeComponent visualization: debuggingVisu) style: 'height: 500px; width:800px;') 