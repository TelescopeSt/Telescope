*Telescope-Cytoscape
exampleAllShapes
	<script: 'self exampleAllShapes open'>

	| visualization |
	visualization := TLVisualization new.
	visualization styleSheet width: 40; height:40; nodeLabel: #forCytoscapeNode.
	visualization layout: TLCircularLayout.
	TLSimpleShape allSubclassesDo: [ :aSubclass | [aSubclass forCytoscapeNode. (visualization addNodeFromEntity: aSubclass) styleSheet shape: aSubclass ] on: TLNotSupportedFunctionalityException do: [  ] ].
	^ visualization