demos
exampleRecursiveCompositeNode
	<script: 'self exampleRecursiveCompositeNode open'>

	| visualization |
	"nodeBuilder childrenNodeBuilder childrenNodeBuilder addInteraction: TLNodeBasicInteraction popup.
"
	visualization := TLButterfly new
		mainEntity: TLObject;
		leftEntities: #superclass;
		rightEntities: #subclasses.
	(visualization
		childrenProperty: #dependentClasses) childrenProperty: #methods.
	visualization styleSheet
		shape: TLRectangle;
		
		nodeLabel: #name position: #inside.
	visualization styleSheet > #children
		layout: RTVerticalLineLayout;
		compositeExpandedByDefault: false;
		nodeLabel: #name position: #inside;
		backgroundColor: Color white.
	visualization
		addInteraction: TLNodeBasicInteraction draggable;
		addInteraction: (TLInspectAction withMenu: 'Inspect');
		addInteraction:
				((TLCustomAction block: [ :node | node entity browse ] condition: [ :node | node entity numberOfMethods < 5 ])
						withMenu: 'Browse').
	^ visualization