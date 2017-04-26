demos
exampleStarVisualization
	"<tlFilter: #visuTemplate>
	<tlFilter: #style>"

	<script: 'self exampleStarVisualization open'>
	| visu |
	self flag: #clean.	"The TLStarVisualization is broken. Add this demo after it is repeared."
	(visu := TLStarVisualization new)
		centerNode: 1;
		aroundNodes: [ :n | (2 to: 25) asOrderedCollection ];
		userBlock: [ :aNode | visu centerNode: aNode entity ];
		enableDefaultInteraction.
	visu styleSheet
		height: [ :each | each + 100 ];
		width: [ :each | each + 100 ].
	^ visu