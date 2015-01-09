tests
testButterflyDemo
	| nodeBuilder butterfly |
	nodeBuilder := TLCompositeNodeBuilder
		childrenProperty: [ :n | 
			{(n - 100).
			(n + 100)} ].
	nodeBuilder childrenNodeBuilder backgroundColor: Color red.
	nodeBuilder addInteraction: (TLInspectAction withMenu: 'Inspect').
	butterfly := TLButterfly new
		mainEntity: 10;
		leftEntities: [ :n | 1 to: n - 1 ];
		rightEntities: (15 to: 20);
		nodeBuilder: nodeBuilder.
	butterfly open.
	butterfly close