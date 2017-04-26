demos
exampleRecursiveCompositeNode
	<script: 'self exampleRecursiveCompositeNode open'>
	<tlFilter: #interaction>
	<tlFilter: #style>
	<tlFilter: #composite>
	<tlFilter: #visuTemplate>
	| visualization |
	visualization := TLButterfly new
		mainEntity: TLDrawable;
		leftEntities: #superclass;
		rightEntities: #subclasses.
	(visualization childrenProperty: #dependentClasses) childrenProperty: #methods.
	visualization styleSheet
		shape: TLRectangle;
		nodeLabel: #name position: #inside.
	(visualization styleSheet > #children)
		layout: TLLinearLayout topToBottom;
		nodeLabel: #name position: #inside;
		backgroundColor: Color white.
	visualization
		addInteraction: TLExpandCollapseCompositeNodeAction onCompositeNodeWithChildren onClick propagateToChildren;
		addInteraction: (TLInspectAction withMenu: 'Inspect');
		addInteraction: ((TLCustomAction block: [ :node | node entity browse ] condition: [ :node | node entity numberOfMethods < 5 ]) withMenu: 'Browse').
	^ visualization