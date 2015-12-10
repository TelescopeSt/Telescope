as yet unclassified
buildVisualization
	| showNodesAction |
	self title: 'Synectique Functional Sequencing'.
	self defineStructure.
	
	self styleSheet
		nodeLabel: #name position: #top.
	
	self > #callNodes addNodeFromEntity: self origin.
	
	showNodesAction := TLCustomAction block: [ :aNode | self showNodesFor: aNode ].
	self > #callNodes
		addInteraction: (showNodesAction withMenu: 'Show links (left click)');
		addInteraction: showNodesAction onClick.
		self defineLinkedCallsInteractions.