multi-visus-demos
exampleTwoConnectedVisualization
	<script: 'self exampleTwoConnectedVisualization'>
	| visu1 visu2 |
	self flag: #todo.	"See how to add this visu in Cytoscape demos."
	visu1 := TLVisualization new.
	visu2 := TLVisualization new.
	visu1 styleSheet nodeLabel: #name.
	visu2 styleSheet nodeLabel: #name.
	visu1 addNodesFromEntities: (1 to: 5).
	visu2 addNodesFromEntities: (-5 to: -1).
	visu1 addInteraction: ((TLStyleCustomizationAction custom: [ :style | style backgroundColor: Color red ] target: [ :aNode | visu2 nodeForEntity: aNode entity negated ]) updateAlso: visu2) onClick.
	visu2
		addInteraction: ((TLStyleCustomizationAction custom: [ :style | style backgroundColor: Color green ] target: [ :aNode | visu1 nodeForEntity: aNode entity negated ]) updateAlso: visu1) onClick.
	visu1 open.
	visu2 open