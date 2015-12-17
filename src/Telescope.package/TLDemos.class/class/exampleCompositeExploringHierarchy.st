demos
exampleCompositeExploringHierarchy
	<script: 'self exampleCompositeExploringHierarchy open'>

	| visualization |

	visualization := TLVisualization new.
	visualization nodeCreationStrategy beRecursive; compositeProperty: #subclasses.
	visualization styleSheet
		childrenLayout: (RTGridLayout new gapSize: 20);
		nodeLabel: [:c | c name asString];
		compositeExpandedByDefault: true;
		backgroundColor: [ :class | 
					class subclasses isNotEmpty
						ifTrue: [ Color lightOrange alpha: 0.5 ]
						ifFalse: [ Color white ] ].
	visualization addNodeFromEntity: Collection.
	^ visualization