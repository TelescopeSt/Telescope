demos
exampleAllShapes
	<script: 'self exampleAllShapes open'>
	<tlFilter: #style>
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
			self flag: #todo.	"Remove dependency to Cytoscape. Maybe implement TLShape class>>#isForNode and TLShape class>>#isForConnection?"
			[ aSubclass forCytoscapeNode.
			(visualization addNodeFromEntity: aSubclass) styleSheet shape: aSubclass ]
				on: TLNotSupportedFunctionalityException
				do: [  ] ].
	^ visualization