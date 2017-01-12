*Telescope-Cytoscape
exampleAllShapes
	<script: 'self exampleAllShapes open'>
	| visualization |
	visualization := TLVisualization new.
	visualization styleSheet
		width: 40;
		height: 40;
		nodeLabel: #displayName.
	visualization layout: TLCircularLayout.
	visualization legend nodeShapeDescription: #displayName forNodes: [ visualization obtain recursively nodes ].
	TLSimpleShape
		allSubclassesDo: [ :aSubclass | 
			[ 
			aSubclass forCytoscapeNode.
			(visualization addNodeFromEntity: aSubclass) styleSheet shape: aSubclass ]
				on: TLNotSupportedFunctionalityException
				do: [  ] ].
	^ visualization