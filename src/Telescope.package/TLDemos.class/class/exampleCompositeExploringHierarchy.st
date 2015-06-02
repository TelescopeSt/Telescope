demos
exampleCompositeExploringHierarchy
	"self exampleCompositeExploringHierarchy"

	| visualization |

	visualization := TLVisualization new.
	visualization styleSheet
		"compositeExpandedByDefault: false;"
		childrenLayout: (RTGridLayout new gapSize: 20);
		childrenProperty: #subclasses;
		beChildrenRecursive;
		nodeLabel: [:c | c name asString];
		backgroundColor: [ :class | 
					class subclasses isNotEmpty
						ifTrue: [ Color lightOrange alpha: 0.5 ]
						ifFalse: [ Color white ] ].
	visualization addNodeFromEntity: Collection.
	visualization open.
	^ visualization