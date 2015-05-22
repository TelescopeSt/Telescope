as yet unclassified
setUp
	| visualization |
	visualization := TLVisualization new.
	group := TLEntitiesGroup new.
	visualization addDrawable: group.
	group 	addNodesFromEntities: (1 to: 4)