demos
exampleRecursiveCompositeNode
	"self exampleRecursiveCompositeNode"

	| nodeBuilder visualization |
	nodeBuilder := TLCompositeNodeBuilder rectangle.
	nodeBuilder childrenProperty: #dependentClasses.
	nodeBuilder childrenNodeBuilder: TLCompositeNodeBuilder rectangle.
	nodeBuilder childrenNodeBuilder
		childrenProperty: #methods;
		expandedByDefault: false;
		nodeLabel: #name position: #inside;
		backgroundColor: Color white.
	nodeBuilder childrenNodeBuilder childrenNodeBuilder addInteraction: TLNodeBasicInteraction popup.
	nodeBuilder
		addInteraction: TLNodeBasicInteraction draggable;
		addInteraction: (TLInspectAction withMenu: 'Inspect');
		addInteraction:
				((TLCustomAction block: [ :node | node entity browse ] condition: [ :node | node entity numberOfMethods < 5 ])
						withMenu: 'Browse').
	nodeBuilder childrenLayout: RTVerticalLineLayout.
	nodeBuilder nodeLabel: #name position: #inside.
	visualization := TLButterfly new
		mainEntity: TLObject;
		leftEntities: #superclass;
		rightEntities: #subclasses;
		nodeBuilder: nodeBuilder.
	visualization open.
	^ visualization