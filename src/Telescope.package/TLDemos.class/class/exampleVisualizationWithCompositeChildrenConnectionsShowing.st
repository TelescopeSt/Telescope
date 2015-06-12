demos
exampleVisualizationWithCompositeChildrenConnectionsShowing
	"self exampleVisualizationWithCompositeChildrenConnectionsShowing"

	| visualization |
	visualization := TLVisualization new.
	visualization styleSheet nodeLabel: #value.
	visualization styleSheet childrenProperty: #primeFactors"; showChildrenConnectionsOnParent".
	(visualization addNodeFromEntity: (((1 to: 40) select: #isPrime) reduce: [:a :b | a * b])) connectTo:
	(visualization addNodeFromEntity: (((41 to: 100) select: #isPrime) reduce: [:a :b | a * b])).
	visualization allChildrenNodes connectFollowingProperty: [ :i | i > 20 ifTrue: [i \\20] ifFalse: [ 0 ] ].
	visualization addInteraction: TLNodeBasicInteraction draggable.
	visualization open.
	^ visualization