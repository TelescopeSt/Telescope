*Telescope-Cytoscape
exampleLineStyle
	<script: 'self exampleLineStyle open'>
	<tlFilter: #style>
	<tlFilter: #group>
	| visualization |
	visualization := TLVisualization new layout: (TLLinearLayout gap: 150).
	TLLineStyle allSubclasses
		doWithIndex: [ :aShape :i | 
			| node connection |
			node := visualization > #group1 addNodeFromEntity: i.
			node styleSheet borderStyle: aShape.
			connection := node connectTo: (visualization > #group2 addNodeFromEntity: i).
			connection styleSheet
				connectionLineStyle: aShape;
				connectionLabel: [ aShape asString ];
				connectionLabelSize: 6 ].
	visualization > #group1 layout: TLLinearLayout topToBottom.
	visualization > #group2 layout: TLLinearLayout topToBottom.
	^ visualization