as yet unclassified
defaultDemo
	| visu |
	visu := TLVisualization new.
	visu
		childrenProperty: [ :i | 
			{(i * 10).
			(i * 15)} ].
	visu addNodesFromEntities: #(1 2).
	visu styleSheet
		nodeLabel: #asString;
		expandCompositeNodes.
	^visu