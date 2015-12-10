*Telescope-Cytoscape
exampleAllShapes
	<script: 'self exampleAllShapes open'>

	| visualization |
	visualization := TLVisualization new.
	visualization layout: RTCircleLayout.
	visualization styleSheet width: 40; height:40; nodeLabel: #forCytoscape.
	TLSimpleShape allSubclassesDo: [ :aSubclass | [aSubclass forCytoscape. (visualization addNodeFromEntity: aSubclass) styleSheet shape: aSubclass ] on: TLNotSupportedFunctionalityException do: [  ] ].
	^ visualization