demos
exampleMovingNodeChangeEntity
	<script: 'self exampleMovingNodeChangeEntity open'>
	| visu |
	visu := TLVisualization new.
	visu addNodesFromEntities: ((1 to: 5) collect: [ :i | (i * 20) @ (i * 20) ]).
	visu addInteraction: (TLCustomWithParameterAction block: [ :node :position | node entity: position ]) onMove.
	visu addInteraction: TLMemorizeNodePositionAction onMove.
	visu styleSheet nodeLabel: #asString.
	^ visu