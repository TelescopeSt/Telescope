demos
exampleConnectAction
	<script: 'self exampleConnectAction open'>
	<tlFilter: #interaction>
	| visu |
	(visu := TLVisualization new)
		addNodesFromEntities: (1 to: 40);
		nodeLabel: #asString.
	visu styleSheet > #connectDemo
		color: Color orange;
		width: 2.
	visu
		addInteraction:
			((TLConnectAction property: [ :n | (1 to: 40) copyWithout: n ] context: visu allNodes)
				connectToOrigin: #even;
				connectionStyle: #connectDemo;
				yourself) onMouseOver.
	^ visu