*Telescope-Cytoscape
exampleBackgroundImages
	<script: 'self exampleLegend open'>
	| visualization |
	visualization := TLVisualization new.
	visualization styleSheet
		shape: TLStar;
		backgroundColor: Color pink.
	{'stephane-ducasse'.
	'USMAN-BHATTI'.
	'nicolas-anquetil'.
	'philippe-valenza-ceo'}
		do: [ :aName | 
			(visualization addNodeFromEntity: aName) styleSheet
				backgroundImageUrl: 'http://synectique.eu/images/' , aName , '.jpg';
				width: 250;
				height: 250 ].
	visualization nodes allButLast do: [ :node | node connectTo: visualization nodes last ].
	visualization layout: TLTreeLayout.
	^ visualization