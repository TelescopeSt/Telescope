as yet unclassified
renderContentOn: html
	| visu |
	selection ifNil: [ selection := ((1 to: 45) collect: [ :i | i -> nil ]) asDictionary ].
	visu := TLVisualization new.
	visu addNodesFromEntities: selection associations.
	visu styleSheet nodeLabel: #asString.
	visu styleSheet position: #value; width: 120.
	visu
		addInteraction:
			(TLCustomAction
				block: [ :aNode | 
					aNode
						entity:
							(aNode entity
								value: aNode position;
								yourself) ]) onMove.
	html anchor
		url: html actionUrl;
		with: 'Reload with defined positions'.
	html render: ((TLCytoscapeComponent visualization: visu) style: 'height: 500px; width:800px;')