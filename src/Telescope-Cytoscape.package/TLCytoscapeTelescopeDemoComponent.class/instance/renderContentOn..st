as yet unclassified
renderContentOn: html
	| visu |
	visu := TLVisualization new.
	visu addNodesFromEntities: (1 to: 45).
	visu addNodeFromEntity: 'Move me to update my position'.
	visu styleSheet nodeLabel: #asString.
	visu addInteraction: (TLCustomAction block: [:aNode | aNode entity: (aNode generator elementFromTLDrawable: aNode) position]) onMove.
	html render: ((TLCytoscapeComponent visualization: visu) style: 'height: 500px; width:800px;')