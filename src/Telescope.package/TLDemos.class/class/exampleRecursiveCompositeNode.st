demos
exampleRecursiveCompositeNode
	"self exampleRecursiveCompositeNode"

	|  visualization |
	
	"nodeBuilder childrenNodeBuilder childrenNodeBuilder addInteraction: TLNodeBasicInteraction popup.
"
	visualization := TLButterfly new
		mainEntity: TLObject;
		leftEntities: #superclass;
		rightEntities: #subclasses.
	visualization styleSheet shape: TLRectangle; childrenProperty: #dependentClasses;nodeLabel: #name position: #inside.
		(visualization styleSheet > #children) layout: RTVerticalLineLayout; childrenProperty: #methods; compositeExpandedByDefault: false;
		nodeLabel: #name position: #inside;
		backgroundColor: Color white.
		visualization addInteraction: TLNodeBasicInteraction draggable;
		addInteraction: (TLInspectAction withMenu: 'Inspect');
		addInteraction:
				((TLCustomAction block: [ :node | node entity browse ] condition: [ :node | node entity numberOfMethods < 5 ])
						withMenu: 'Browse').
	visualization open.
	^ visualization