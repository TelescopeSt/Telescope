demos
exampleMovingNodeChangeEntity
	<script: 'self exampleMovingNodeChangeEntity open'>
	<tlFilter: #interaction>
	| visu |
	visu := TLVisualization fromEntities: ((1 to: 5) collect: [ :i | (i * 20) @ (i * 20) ]).
	visu
		addInteractions:
			{(TLCustomWithParameterAction block: [ :node :position | node entity: position x asInteger @ position y asInteger ]) onMove.
			TLMemorizeNodePositionAction onMove}.
	visu styleSheet
		nodeLabel: #asString position: #top;
		labelSize: 8.
	^ visu