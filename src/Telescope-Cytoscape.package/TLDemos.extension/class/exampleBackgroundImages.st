*Telescope-Cytoscape
exampleBackgroundImages
	<script: 'self exampleBackgroundImages open'>
	<tlFilter: #style>
	| visualization |
	visualization := TLVisualization new.
	visualization styleSheet
		shape: TLStar;
		backgroundColor: Color pink.
	#('fillon' 'lepen' 'macron' 'jlm')
		do: [ :aName | 
			(visualization addNodeFromEntity: aName) styleSheet
				backgroundImageUrl: (CYSDemoFileLibrary urlOf: aName , 'Png') asUrl;
				width: 250;
				height: 250 ].
	visualization nodes allButLast do: [ :node | node connectTo: visualization nodes last ].
	visualization mouseOverPopUp.
	visualization
		addInteraction:
			(TLCustomAction
				block: [ :node | 
					visualization nodes removeAllConnections.
					(visualization nodes copyWithout: node) connectTo: node ]) onClick.
	visualization layout: TLTreeLayout.
	^ visualization