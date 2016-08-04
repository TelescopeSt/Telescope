as yet unclassified
renderContentOn: html
	| visu |
	selection ifNil: [ selection := ((1 to: 45) collect: [ :i | i -> nil ]) asDictionary ].
	visu := TLVisualization new.
	visu childrenProperty: #().
	visu addNodesFromEntities: selection associations.
	visu styleSheet nodeLabel: #asString.
	visu styleSheet
		position: #value;
		width: 120.
	visu addInteraction: TLMemorizeNodePositionAction onMove.
	visu
		addInteraction:
			(TLCustomAction
				block: [ :aNode | 
					aNode
						entity:
							(aNode entity
								value: aNode position;
								yourself) ]) onMove.
	visu
		addInteraction:
			(TLCustomWithParameterAction block: [ :aDrawable :aDroppedDrawable | aDroppedDrawable parent: aDrawable ]) onDrop.
	html anchor
		url: html actionUrl;
		with: 'Reload with defined positions'.
	html render: ((TLCytoscapeComponent visualization: visu) style: 'height: 500px; width:800px;')