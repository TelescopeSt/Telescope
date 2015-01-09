tests
testComponentVisuOpening
	| nodeBuilder componentBuilder |
	nodeBuilder := TLCompositeNodeBuilder new
		childrenProperty: #(1 2 3);
		childrenLayout: (RTVerticalLineLayout withGap: 10).
	nodeBuilder backgroundColor: Color gray muchLighter.
	nodeBuilder addInteraction: (TLInspectAction withMenu: 'Inspect').
	nodeBuilder childrenNodeBuilder backgroundColor: Color red.
	componentBuilder := TLComponentVizuBuilder new
		componentsToDisplay: {1};
		nodeBuilder: nodeBuilder.
	componentBuilder open.
	componentBuilder close.	