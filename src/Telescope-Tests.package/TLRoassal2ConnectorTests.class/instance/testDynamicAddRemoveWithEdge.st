as yet unclassified
testDynamicAddRemoveWithEdge
	| visu  interaction node |
	interaction := ((TLExpandCollapseNodesAction new property: #subclasses)
		withTriggerStyle: [:triggerStyle :aNode | triggerStyle shape: TLEllipse; backgroundColor: Color red]) onClick.
	visu := TLVisualization new generator: connector.
	node := visu addNodeFromEntity: TLObject.
	
	visu addInteraction: interaction.
	
	protocol describe exactly: 2 times: view recv: #add:. "1 for the node 1 for the blue circle"
	protocol describe once: view recv: #addAll:.
	visu generate.
	
	protocol describe exactly: 18 times: view recv: #add:. "13 for edges, 13 for nodes"
	protocol describe once: view recv: #removeElement:. "for the blue circle"
	protocol describe once: view recv: #add:. "for the blue circle"
	protocol describe once: view recv: #signalUpdate.
	interaction actionOn: node.
	
	protocol describe exactly: 9 times: view recv: #removeElement:. "for the nodes"
	protocol describe exactly: 9 times: view recv: #removeEdge:. "for the edges"
	protocol describe once: view recv: #removeElement:. "for the blue circle"
	protocol describe once: view recv: #add:. "for the blue circle"
	protocol describe once: view recv: #signalUpdate.
	interaction actionOn: node.