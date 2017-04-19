demos
exampleAdaptNodeWidthFromLabel
	<script: 'self exampleAdaptNodeWidthFromLabel open'>
	<tlFilter: #style>
	| visu |
	visu := TLVisualization new.
	visu styleSheet
		nodeLabel: #asString;
		adaptNodeWidthFromLabelWithDefault: 20.
	visu addNodesFromEntities: ((0 to: 26) collect: [ :number | Character alphabet first: number ]).
	^ visu