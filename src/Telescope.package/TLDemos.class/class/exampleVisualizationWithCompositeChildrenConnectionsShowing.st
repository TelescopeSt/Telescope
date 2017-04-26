demos
exampleVisualizationWithCompositeChildrenConnectionsShowing
	<script: 'self exampleVisualizationWithCompositeChildrenConnectionsShowing open'>
	<tlFilter: #interaction>
	<tlFilter: #composite>
	| visualization node1 node2 |
	visualization := TLVisualization new.
	visualization styleSheet nodeLabel: #value; childrenLayout: (TLLinearLayout gap: 20 ratio: 9/16).
	visualization layout gap: 30.
	visualization childrenProperty: #primeFactors.	"; showChildrenConnectionsOnParent"
	node1 := visualization addNodeFromEntity: (((1 to: 40) select: #isPrime) reduce: [ :a :b | a * b ]).
	node2 := visualization addNodeFromEntity: (((41 to: 100) select: #isPrime) reduce: [ :a :b | a * b ]).
	node1 styleSheet nodeLabelPosition: #left.
	node2 styleSheet nodeLabelPosition: #right.
	visualization allChildrenNodes do: [ :c | c styleSheet nodeLabelPosition: #inside ].
	node1 connectTo: node2.
	visualization allChildrenNodes
		connectFollowingProperty: [ :i | 
			i > 20
				ifTrue: [ i \\ 20 ]
				ifFalse: [ 0 ] ].
	visualization addInteraction: TLExpandCollapseCompositeNodeAction onCompositeNodeWithChildren onClick propagateToChildren.
	^ visualization