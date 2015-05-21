demos
exampleCompositeExploringHierarchy
	"self exampleCompositeExploringHierarchy"

	| recursiveNodeBuilder visualization |
	recursiveNodeBuilder := TLCompositeNodeBuilder childrenProperty: #subclasses.
	recursiveNodeBuilder expandedByDefault: false.
		
	recursiveNodeBuilder childrenLayout: (RTGridLayout new gapSize: 20).
	recursiveNodeBuilder childrenNodeBuilder: recursiveNodeBuilder.
	visualization := TLVisualization new
		nodeBuilder: recursiveNodeBuilder.
	visualization styleSheet nodeLabel: #name;
		backgroundColor: [ :class | 
			class subclasses isNotEmpty
				ifTrue: [ Color lightOrange alpha: 0.5 ]
				ifFalse: [ Color white ] ].
	visualization addNodeFromEntity: Collection.
	visualization styleSheet childrenProperty: #subclasses.
	visualization open.
	^ visualization