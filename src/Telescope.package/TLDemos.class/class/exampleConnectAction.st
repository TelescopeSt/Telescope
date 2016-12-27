demos
exampleConnectAction
	<script: 'self exampleConnectAction open'>
	| visu |
	(visu := TLVisualization new)
		addNodesFromEntities: (1 to: 60);
		nodeLabel: #asString.
	visu
		addInteraction:
			((TLConnectAction property: [ :n | (1 to: 60) copyWithout: n ] context: visu allNodes) connectToOrigin: #even)
				onMouseOver.
	^ visu