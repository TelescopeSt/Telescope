demos
exampleCompositeNodeWithLabelInsideInButterfly
	"self exampleCompositeNodeWithLabelInsideInButterfly"
	| nodeBuilder butterfly |
	nodeBuilder := TLCompositeNodeBuilder
		childrenProperty: [ :n | 
			{(n - 100).
			(n + 100)} ].
	nodeBuilder childrenNodeBuilder nodeLabel: #name position: #inside.
	butterfly := TLButterfly new
		mainEntity: 10;
		leftEntities: [ :n | 1 to: n - 1 ];
		rightEntities: (15 to: 20);
		nodeBuilder: nodeBuilder.
	butterfly open.
	^ butterfly
	