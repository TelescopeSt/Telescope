demos
exampleStarVisualization
	<script: 'self exampleStarVisualization open'>
	<tlFilter: #visuTemplate>
	<tlFilter: #style>
	| visu |
	visu := TLStarVisualization new.
	visu
		centerNode: 1;
		aroundNodes: [ :n | (2 to: 25) asOrderedCollection ].
	visu
		userBlock: [ :aNode | visu centerNode: aNode entity ];
		enableDefaultInteraction.
	visu styleSheet
		shape: TLEllipse;
		height: [ :each | each + 100 ];
		width: [ :each | each + 100 ].
	^ visu