demos
exampleCompositeExploringHierarchy
	"self exampleCompositeExploringHierarchy"

	| recursiveNodeBuilder visualization |
	recursiveNodeBuilder := TLCompositeNodeBuilder childrenProperty: #subclasses.
	recursiveNodeBuilder expandedByDefault: false.
	recursiveNodeBuilder
		backgroundColor: [ :class | 
			class subclasses isNotEmpty
				ifTrue: [ Color lightOrange alpha: 0.5 ]
				ifFalse: [ Color white ] ].
	recursiveNodeBuilder nodeLabel: #name.
	recursiveNodeBuilder childrenLayout: (RTGridLayout new gapSize: 20).
	recursiveNodeBuilder childrenNodeBuilder: recursiveNodeBuilder.
	visualization := TLVisualization new
		nodeBuilder: recursiveNodeBuilder.
	visualization addNodeFromEntity: Collection.
	visualization open.
	^ visualization