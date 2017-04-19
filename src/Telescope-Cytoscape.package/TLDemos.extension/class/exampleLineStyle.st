*Telescope-Cytoscape
exampleLineStyle
	<script: 'self exampleLineStyle open'>
	<tlFilter: #style>
	<tlFilter: #group>
	| visualization |
	visualization := TLVisualization new layout: (TLLinearLayout gap: 150).
	TLLineStyle allSubclasses
		doWithIndex: [ :aShape :i | 
			| node |
			node := visualization > #group1 addNodeFromEntity: i.
			node styleSheet borderStyle: aShape.
			(node connectTo: (visualization > #group2 addNodeFromEntity: i)) styleSheet connectionLineStyle: aShape ].
	visualization > #group1 layout: TLLinearLayout topToBottom.
	visualization > #group2 layout: TLLinearLayout topToBottom.
	^ visualization