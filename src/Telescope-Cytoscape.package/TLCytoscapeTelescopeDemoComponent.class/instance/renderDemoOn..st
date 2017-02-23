rendering
renderDemoOn: html
	| visu debuggingVisu visuId |
	self renderTopMenuOn: html.
	visuId := TLCytoscapeComponent generateId.
	self method ifNil: [ visu := self defaultDemo ] ifNotNil: [ visu := TLDemos executeDemo: self method ].
	html div
		id: #demo;
		style: 'height: 500px; width:100%;';
		with: [ 
					html div style: 'height: 20px;'.
					debuggingVisu := TLDebuggingVisualizationTreeViewer visu: visu.
					visu addInteraction: (self externalTriggerExemple: html onVisu: visuId).
					visu addInteraction: (self drillDownAction: html onVisu: visuId).
					visu
						addInteraction:
							((TLCustomWithParameterAction block: [ :aDrawable :aDroppedDrawable | aDroppedDrawable parentNode: aDrawable ])
								updateAlso: debuggingVisu) onDrop.
					html render: (TLCytoscapeComponent visualization: visu id: visuId) ].
	html preformatted
		id: #code;
		style: 'width: 100%;';
		with: [ 
					html code
						class: 'smalltalk';
						with:
								(self codeOf: (self method ifNotNil: [ :m | TLDemos class >> m asSymbol ] ifNil: [ self class >> #defaultDemo ])) ].
	html div
		id: #debug;
		style: 'height: 500px; width: 100%;';
		with: [ html render: (TLCytoscapeComponent visualization: debuggingVisu) ]