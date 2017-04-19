*Telescope-Cytoscape
exampleBackgroundImages
	<script: 'self exampleBackgroundImages open'>
	<tlFilter: #style>
	| visualization |
	visualization := TLVisualization new.
	visualization styleSheet
		shape: TLStar;
		backgroundColor: Color pink.
	{'Stphane-Ducasse' . 'USMAN-BHATTI' . 'nicolas-anquetil' . 'Photo_Philippe_Valenza'}
		do: [ :aName | 
			(visualization addNodeFromEntity: aName) styleSheet
				backgroundImageUrl: 'http://synectique.eu/images/' , aName , '.jpg';
				width: 250;
				height: 250 ].
	visualization nodes allButLast do: [ :node | node connectTo: visualization nodes last ].
	visualization mouseOverPopUp.
	visualization
		addInteraction:
			(TLCustomAction
				block: [ :node | 
					visualization nodes removeAllConnections.
					visualization nodes \ {node} connectTo: node ]) onClick.
	visualization layout: TLTreeLayout.
	^ visualization