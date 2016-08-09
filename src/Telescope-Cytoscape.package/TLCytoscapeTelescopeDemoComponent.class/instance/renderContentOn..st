as yet unclassified
renderContentOn: html
	| visu |
	visu := TLVisualization new.
	visu childrenProperty: #self.
	visu addNodesFromEntities: #(1 2).
		
	visu styleSheet
		nodeLabel: #asString;
		expandCompositeNodes.
	visu
		addInteraction:
			(TLCustomWithParameterAction block: [ :aDrawable :aDroppedDrawable | aDroppedDrawable parent: aDrawable ]) onDrop.
	html render: ((TLCytoscapeComponent visualization: visu) style: 'height: 500px; width:800px;')