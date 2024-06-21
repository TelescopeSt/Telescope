"
A TLDemos class is a class regrouping all the demos of Telescope on the class side.

"
Class {
	#name : #TLDemos,
	#superclass : #TLObject,
	#category : #'Telescope-Demo'
}

{ #category : #accessing }
TLDemos class >> allDemoName [
	^ (TLDemos class methods select: [ :m | m protocol = #demos or: [ m protocol = #'*Telescope-Cytoscape' ] ]) sort: [ :m1 :m2 | m1 selector < m2 selector ]
]

{ #category : #accessing }
TLDemos class >> allDemoVisualizations [
	^ TLDemos class methods
		select: [ :m | m protocol = #demos or: [ m protocol = #'*Telescope-Cytoscape' ] ]
		thenCollect: [ :m | TLDemos perform: m selector ]
]

{ #category : #demos }
TLDemos class >> exampleAdaptNodeWidthFromLabel [
	<script: 'self exampleAdaptNodeWidthFromLabel open'>
	<tlFilter: #style>
	| visu |
	visu := TLVisualization fromEntities: ((0 to: 26) collect: [ :number | Character alphabet first: number ]).
	visu styleSheet
		nodeLabel: #asString;
		adaptNodeWidthFromLabelWithDefault: 20.
	^ visu
]

{ #category : #demos }
TLDemos class >> exampleAllShapes [
	<script: 'self exampleAllShapes open'>
	<tlFilter: #style>
	| visualization |
	visualization := TLVisualization new.
	visualization styleSheet
		width: 40;
		height: 40;
		nodeLabel: #displayName.
	visualization layout: TLCircularLayout.
	visualization legend nodeShapeDescription: #displayName forNodes: [ visualization obtain recursively nodes ].
	visualization generator nodesShapesAvailableForConnector do: [ :aSubclass | (visualization addNodeFromEntity: aSubclass) styleSheet shape: aSubclass ].
	^ visualization
]

{ #category : #demos }
TLDemos class >> exampleButterflyUsingStyleFunctionnality [
	<script: 'self exampleButterflyUsingStyleFunctionnality open'>
	<tlFilter: #style>
	<tlFilter: #visuTemplate>
	| butterfly |
	butterfly := TLButterfly new
		mainEntity: 10;
		leftEntities: [ :n | 1 to: n - 1 ];
		rightEntities: (15 to: 20).
	butterfly styleSheet
		shape: TLEllipse;
		width: 40;
		borderWidth: 0.5.
	(butterfly styleSheet > #redBackground)
		backgroundColor: Color red;
		textColor: Color red.
	butterfly > #left addStyle: #redBackground.
	^ butterfly
]

{ #category : #demos }
TLDemos class >> exampleChangingLayout [
	<script: 'self exampleChangingLayout open'>
	<tlFilter: #layout>
	| visu |
	visu := TLVisualization new.
	(visu > #group1) styleSheet
		width: 200;
		height: 50;
		nodeLabel: [ :lay | lay class asString ].
	(visu > #group2) styleSheet
		width: 30;
		height: 30;
		shape: TLRhomboid.
	(visu > #group1)
		layout: TLLinearLayout topToBottom;
		addNodesFromEntities:
			{(TLLinearLayout angle: 90).
			(TLTreeLayout angle: 180).
			TLCircularLayout new};
		addInteraction: (TLCustomAction block: [ :aNode | visu > #group2 layout: aNode entity ]) onClick.
	(visu > #group2)
		addNodesFromEntities: Collection withAllSubclasses;
		connectFollowingProperty: #superclass;
		addInteraction: TLPopUpAction onMouseOver;
		layout: TLCircularLayout.
	visu layout: TLLinearLayout leftToRight.
	^ visu
]

{ #category : #demos }
TLDemos class >> exampleCompositeExploringHierarchy [
	<script: 'self exampleCompositeExploringHierarchy open'>
	<tlFilter: #layout>
	<tlFilter: #composite>
	| visualization |
	visualization := TLVisualization new.
	visualization nodeCreationStrategy
		beRecursive;
		compositeProperty: #subclasses.
	visualization styleSheet
		childrenLayout:
			((TLLinearLayout maximumDimension: 1200)
				horizontalGap: 30;
				verticalGap: 60;
				yourself);
		nodeLabel: #asString;
		nodeLabelPosition: [ :e :n | 
			n hasChildrenToDisplay
				ifTrue: [ #bottom ]
				ifFalse: [ #inside ] ];
		width: 250;
		compositeExpandedByDefault: true;
		backgroundColor: [ :class | 
			class subclasses isNotEmpty
				ifTrue: [ MDLColor teal alpha: 0.3 ]
				ifFalse: [ MDLColor white ] ].
	visualization addNodeFromEntity: Collection.
	(visualization addInteraction: TLExpandCollapseCompositeNodeAction onCompositeNodeWithChildren onClick) propagateToChildren.
	^ visualization
]

{ #category : #'not working demos' }
TLDemos class >> exampleCompositeNodeWithLabelInsideInButterfly [
	"<script: 'self exampleCompositeNodeWithLabelInsideInButterfly open'>
	<tlFilter: #composite>
	<tlFilter: #visuTemplate>"
	| butterfly |
	self flag: 'Invalid demo; cannot run like this. #addCompositeDefaultCollapseInteraction is broken because of Triggers.'.
	butterfly := TLButterfly new
		mainEntity: 10;
		leftEntities: [ :n | 1 to: n - 1 ];
		rightEntities: (15 to: 20).
	butterfly nodeCreationStrategy
		compositeProperty: [ :n | 
			{(n - 100).
			(n + 100)} ].
	butterfly addCompositeDefaultCollapseInteraction.
	^ butterfly
]

{ #category : #demos }
TLDemos class >> exampleConnectAction [
	<script: 'self exampleConnectAction open'>
	<tlFilter: #interaction>
	| visu |
	(visu := TLVisualization fromEntities: (1 to: 40)) nodeLabel: #asString.
	(visu styleSheet > #connectDemo)
		color: Color orange;
		width: 2.
	visu
		addInteraction:
			((TLConnectAction property: [ :n | (1 to: 40) copyWithout: n ] context: visu allNodes)
				connectToOrigin: #even;
				connectionStyle: #connectDemo;
				yourself) onMouseOver.
	^ visu
]

{ #category : #demos }
TLDemos class >> exampleConnectionStyle [
	<script: 'self exampleConnectionStyle open'>
	<tlFilter: #style>
	<tlFilter: #group>
	| visualization lastNode |
	visualization := TLVisualization new.
	visualization layout gap: 150.
	visualization generator connectionHeadShapesAvailableForConnector
		doWithIndex: [ :aShape :i | 
			| node1 node2 connection |
			node1 := visualization > #group1 addNodeFromEntity: i.
			node2 := visualization > #group2 addNodeFromEntity: i.
			connection := node1 connectTo: node2.
			connection styleSheet > #head shape: aShape.
			connection styleSheet
				connectionLabel: [ aShape asString ];
				connectionLabelSize: 10 ].
	lastNode := visualization > #group1 addNodeFromEntity: 'last'.
	(lastNode connectTo: (visualization > #group2 addNodeFromEntity: 'last')) styleSheet curveStyle: TLSegmentsCurve.
	visualization > #group1 layout: TLLinearLayout topToBottom.
	visualization > #group2 layout: TLLinearLayout topToBottom.
	^ visualization
]

{ #category : #demos }
TLDemos class >> exampleConnectionsCustomization [
	<script: 'self exampleConnectionsCustomization open'>
	<tlFilter: #style>
	<tlFilter: #group>
	| visualization source group2 |
	visualization := TLVisualization new.
	source := visualization > #group1 addNodeFromEntity: #source.
	group2 := visualization > #group2.
	{(1 -> #red).
	(2 -> #green).
	(3 -> #blue).
	(4 -> #yellow)} do: [ :asso | (source connectTo: (group2 addNodeFromEntity: asso key)) styleSheet color: (MDLColor tint: asso value) ].
	group2 layout: TLLinearLayout topToBottom.
	^ visualization
]

{ #category : #demos }
TLDemos class >> exampleCustomMultiChoiceAction [
	<script: 'self exampleCustomMultiChoiceAction open'>
	<tlFilter: #interaction>
	| visu |
	visu := TLVisualization fromEntities: #(Henry John Catherine Paule Isabel).
	visu layout gap: 40.
	visu styleSheet nodeLabel: #asString position: #top.

	"Print on Transcript selected node and selected item in the menu obtains from a right click."
	visu
		addInteraction:
			((TLCustomWithParameterAction
				block: [ :node :choice | 
					Transcript
						show: node entity asString;
						show: ' wants ';
						show: choice;
						cr ]) withMultipleChoices: [ :aNode | #('french fries' 'potatoes' 'mashed potatoes' 'baked potatoes') ] menu: 'Choose your dish').
	^ visu
]

{ #category : #demos }
TLDemos class >> exampleCycleDependencies [
	<script: 'self exampleCycleDependencies open'>
	<tlFilter: #visuTemplate>

	^ TLCycleDependencies new
		entities: TLDrawable withAllSubclasses;
		property: [ :each | (OrderedCollection with: each allSubclasses with: each superclass) flattened ];
		widthBlock: [ :each | each instVarNames size * 3 max: 5 ];
		heightBlock: [ :each | each numberOfMethods / 2 max: 5 ];
		yourself
]

{ #category : #demos }
TLDemos class >> exampleDistributionMap [
	<script: 'self exampleDistributionMap open'>
	<tlFilter: #visuTemplate>
	^ (TLDistributionMap
		containerEntities: TLObject withAllSubclasses
		innerEntities: #methods
		property: #numArgs)
		innerEntitiesPopupBlock: [ :method | method name , ' have ' , method numArgs asString , ' arguments' ];
		yourself
]

{ #category : #demos }
TLDemos class >> exampleDistributionMapAbstractMethodsCollection [
	<script: 'self exampleDistributionMapAbstractMethodsCollection open'>
	<tlFilter: #visuTemplate>
	^ (TLDistributionMap
		containerEntities: TLDrawable withAllSubclasses
		innerEntities: #methods
		property: #isAbstract)
		innerEntitiesPopupBlock: [ :method | method name asString ];
		propertySortingBlock: [ :boolean1 :boolean2 | boolean1 ];
		yourself
]

{ #category : #demos }
TLDemos class >> exampleExpandCollapseNodesAction [
	<script: 'self exampleExpandCollapseNodesAction open'>
	<tlFilter: #interaction>
	<tlFilter: #layout>
	| visu |
	(visu := TLVisualization fromEntities: (1 to: 9))
		layout:
			(TLTreeLayout new
				useOutgoingLinks;
				leavesGap: 40;
				levelGap: 20;
				yourself);
		addInteraction: (TLExpandCollapseNodesAction property: [ :n | (0 to: 9) collect: [ :i | n * 10 + i ] ]) onClick.
	visu styleSheet nodeLabel: #asString.
	^ visu
]

{ #category : #demos }
TLDemos class >> exampleFLowControl [
	<script: 'self exampleFLowControl open'>
	<tlFilter: #visuTemplate>

	| a b c d e f g visu |
	a := TLBasicBlock title: 'a'.
	b := TLBasicBlock title: 'b'.
	c := TLBasicBlock title: 'c'.
	d := TLBasicBlock title: 'd'.
	e := TLBasicBlock title: 'e'.
	f := TLBasicBlock title: 'f'.
	g := TLBasicBlock title: 'g'.
	
	a next: { b. c . f }.
	b next: { d }.
	c next: { d. e }.
	d next: { g }.
	e next: { f }.
	f next: { g }.
	
	visu := TLFlowGraph new
		entryPoint: a;
		nextProperty: #next.
	visu addInteraction: (TLPopUpAction text: #title) onMouseOver.
	visu styleSheet nodeLabel: #title.
	 ^ visu
]

{ #category : #demos }
TLDemos class >> exampleGradient [
	<script: 'self exampleGradient open'>
	<tlFilter: #style>
	| visu |
	visu := TLVisualization new.
	visu > #color addNodesFromEntities: (1 to: 60).
	(visu > #color) styleSheet
		backgroundColor:
			((MDLColor red property: #yourself gradientAt: 5)
				to: MDLColor orange at: 15;
				to: MDLColor yellow at: 30;
				to: MDLColor green at: 50).
	visu > #gray addNodesFromEntities: (1 to: 10).
	(visu > #gray) styleSheet backgroundColor: ((MDLColor white property: #yourself gradientAt: 1) to: MDLColor black at: 10).
	^ visu
]

{ #category : #demos }
TLDemos class >> exampleHideAndShowConnections [
	<script: 'self exampleHideAndShowConnections open'>
	<tlFilter: #interaction>
	| visualization secondNode firstNode thirdNode connection connection2 |
	visualization := TLVisualization new.
	visualization layout gap: 50.
	firstNode := visualization addNodeFromEntity: 2.
	secondNode := visualization addNodeFromEntity: 1.
	secondNode styleSheet nodeLabel: 'Click on me!' position: #top.
	thirdNode := visualization addNodeFromEntity: 3.
	connection := secondNode connectTo: firstNode.
	connection2 := secondNode connectTo: thirdNode.
	connection2 hide.
	visualization
		addInteractions:
			{(TLHideAction on: connection) onClick.
			(TLShowAction on: connection2) onClick}.
	^ visualization
]

{ #category : #demos }
TLDemos class >> exampleHideAndShowNode [
	<script: 'self exampleHideAndShowNode open'>
	<tlFilter: #interaction>
	| visualization secondNode firstNode thirdNode |
	visualization := TLVisualization new.
	visualization layout gap: 50.
	firstNode := visualization addNodeFromEntity: 2.
	secondNode := visualization addNodeFromEntity: 1.
	secondNode styleSheet nodeLabel: 'Click on me!' position: #top.
	thirdNode := visualization addNodeFromEntity: 3.
	thirdNode hide.
	secondNode
		addInteractions:
			{(TLHideAction on: firstNode) onClick.
			(TLShowAction on: thirdNode) onClick}.
	^ visualization
]

{ #category : #demos }
TLDemos class >> exampleHighlightElements [
	<script: 'self exampleHighlightElements open'>
	<tlFilter: #interaction>
	<tlFilter: #style>
	| visualization highlightInteraction |
	visualization := TLVisualization fromEntities: ($a to: $z).
	highlightInteraction := (TLStyleCustomizationAction
		custom: [ :style | 
			style
				borderColor: Color red lighter;
				color: Color red lighter ]) onMouseOver.
	visualization
		addInteractions:
			{highlightInteraction.
			(TLCustomAction
				block: [ :drawable | 
					visualization close.
					TLVisualization new
						addNodeFromEntity: drawable entity;
						open ]) onClick}.
	visualization layout: TLCircularLayout new.	
	"By default connections do not inherit interactions so I have to define it"
	(visualization 
		connectFollowingProperty: [ :aChar | (1 to: (0 to: 3) atRandom) collect: [ :i | (($a to: $z) copyWithout: aChar) atRandom ] ]) addInteraction: highlightInteraction.
	^ visualization
]

{ #category : #demos }
TLDemos class >> exampleLabelWrap [
	<script: 'self exampleLabelWrap open'>
	<tlFilter: #style>
	| visualization noWrap automaticWrap forcedWrap ellipsis |
	visualization := TLVisualization new.
	visualization styleSheet
		width: 40;
		height: 40;
		layout:
			((TLLinearLayout perLine: 2)
				gap: 200;
				yourself);
		nodeLabel: #yourself position: #top.
	noWrap := visualization addNodeFromEntity: 'This is a node without wrap'.
	automaticWrap := visualization addNodeFromEntity: 'This is a node with an automatic wrap'.
	automaticWrap styleSheet
		nodeLabelWrap: 'wrap';
		nodeLabelMaxWidth: 100.
	forcedWrap := visualization addNodeFromEntity: 'ThisIsANodeWithAForcedWrap'.
	forcedWrap styleSheet
		nodeLabelWrap: 'wrap';
		nodeLabelMaxWidth: 100;
		nodeLabel: [ :string | string insertLineReturnEvery: 8 ].
	ellipsis := visualization addNodeFromEntity: 'This is a node with an ellipsed label blablablablablabla'.
	self flag: #todo. "It is possible this one does not work yet since it require a more recent cytoscape that what we have."
	ellipsis styleSheet
		nodeLabelWrap: 'ellipsis';
		nodeLabelMaxWidth: 250.
	^ visualization
]

{ #category : #demos }
TLDemos class >> exampleLayoutsAngle [
	<script: 'self exampleLayoutsAngle open'>
	<tlFilter: #layout>
	| visualization |
	visualization := TLVisualization fromEntities: (0 to: 359).
	visualization layout: ((TLLinearLayout maximumDimension: 300) angle: 360 atRandom).
	visualization styleSheet backgroundColor: ((MDLColor red property: #yourself gradientAt: 0) to: MDLColor yellow at: 360).
	visualization
		addInteraction:
			(TLCustomAction
				block: [ :node | 
					visualization layout angle: node entity.
					visualization requireLayoutApplication ]) onClick.
	visualization addInteraction: (TLPopUpAction text: [ :e | 'Turn to an angle of ', e asString , '°' ]) onMouseOver.
	^ visualization
]

{ #category : #demos }
TLDemos class >> exampleLegend [
	<script: 'self exampleLegend open'>
	<tlFilter: #legend>
	| visualization |
	visualization := TLVisualization fromEntities: (1 to: 100).
	visualization legend
		descriptionForHeight: 'Text explaining height';
		descriptionForWidth: 'Text explaining width'.
	^ visualization
]

{ #category : #demos }
TLDemos class >> exampleLineStyle [
	<script: 'self exampleLineStyle open'>
	<tlFilter: #style>
	<tlFilter: #group>
	| visualization |
	visualization := TLVisualization new.
	visualization layout gap: 150.
	TLLineStyle allSubclasses
		doWithIndex: [ :aShape :i | 
			| node connection |
			node := visualization > #group1 addNodeFromEntity: i.
			node styleSheet borderStyle: aShape.
			connection := node connectTo: (visualization > #group2 addNodeFromEntity: i).
			connection styleSheet
				connectionLineStyle: aShape;
				connectionLabel: [ aShape asString ];
				connectionLabelSize: 6 ].
	visualization > #group1 layout: TLLinearLayout topToBottom.
	visualization > #group2 layout: TLLinearLayout topToBottom.
	^ visualization
]

{ #category : #demos }
TLDemos class >> exampleMovingNodeToAnotherGroup [
	<script: 'self exampleMovingNodeToAnotherGroup open'>
	<tlFilter: #group>
	<tlFilter: #interaction>

	| visualization |
	visualization := TLVisualization new.
	visualization styleSheet nodeLabel: #asString.
	visualization > #group1
		layout: TLLinearLayout topToBottom;
		addNodesFromEntities: ($a to: $d);
		addInteraction: (TLMoveConnectableAction destination: visualization > #group2) onClick;
		addInteraction: (TLStyleCustomizationAction custom: [:style | style backgroundColor: Color red]) onMouseOver.
	visualization > #group2
		layout: TLLinearLayout topToBottom;
		addNodesFromEntities: ($e to: $h);
		addInteraction: (TLMoveConnectableAction destination: visualization > #group1) onClick;
		addInteraction: (TLStyleCustomizationAction custom: [:style | style backgroundColor: Color blue]) onMouseOver.
	^ visualization
]

{ #category : #demos }
TLDemos class >> exampleMovingNodeToFirstPosition [
	<script: 'self exampleMovingNodeToFirstPosition open'>
	<tlFilter: #interaction>
	| visualization |
	visualization := TLVisualization fromEntities: ($a to: $f).
	visualization styleSheet nodeLabel: #asString.
	visualization
		layout: TLLinearLayout topToBottom;
		addInteraction: (TLCustomAction block: [ :aNode | visualization moveToFirstPosition: aNode ]) onClick;
		addInteraction: (TLStyleCustomizationAction custom: [ :style | style backgroundColor: Color red ]) onMouseOver.
	^ visualization
]

{ #category : #demos }
TLDemos class >> exampleNameCloud [
	<script: 'self exampleNameCloud open'>
	<tlFilter: #visuTemplate>
	^ TLNameCloud new
		entities: (TLDrawable withAllSubclasses flatCollect: #methods);
		nameProperty: #selector;
		yourself
]

{ #category : #demos }
TLDemos class >> exampleNodeLabelPosition [
	<script: 'self exampleNodeLabelPosition open'>
	<tlFilter: #style>
	| visu |
	visu := TLVisualization new.
	#(top center bottom) do: [ :vert | #(left center right) do: [ :hor | visu addNodeFromEntity: vert -> hor ] ].
	visu layout: (TLLinearLayout gap: 50 perLine: 3).
	visu styleSheet
		nodeLabel: #asString
		position: [ :each | 
			TLPosition new
				horizontal: each value;
				vertical: each key;
				yourself ].
	^ visu
]

{ #category : #demos }
TLDemos class >> examplePackageHierarchy [
	<script: 'self examplePackageHierarchy open'>
	<tlFilter: #visuTemplate>
	^ TLPackageHierarchy new
		entities: TLDrawable withAllSubclasses;
		nameProperty: #name;
		property: #superclass;
		widthProperty: #numberOfMethods;
		heightProperty: #instSize;
		yourself
]

{ #category : #demos }
TLDemos class >> examplePathBuilder [
	<script: 'self examplePathBuilder open'>
	<tlFilter: #visuTemplate>
	^ TLPathBuilder new
		origin: 42;
		incomingBlock: [ :aNumber | aNumber to: aNumber + 10 ];
		outgoingBlock: [ :aNumber | aNumber - 11 to: aNumber - 1 ];
		yourself
]

{ #category : #demos }
TLDemos class >> examplePopUp [
	<script: 'self examplePopUp open'>
	<tlFilter: #interaction>
	| visu |
	visu := TLVisualization new.
	#(top center bottom) do: [ :vert | #(left center right) do: [ :hor | visu addNodeFromEntity: vert -> hor ] ].
	visu layout: (TLLinearLayout perLine: 3).
	visu
		addInteraction:
			(TLPopUpAction
				text: #asString
				position: [ :each | 
					TLPosition new
						horizontal: each value;
						vertical: each key;
						yourself ]) onMouseOver.
	^ visu
]

{ #category : #demos }
TLDemos class >> exampleProjectMap [
	<script: 'self exampleProjectMap open'>
	<tlFilter: #visuTemplate>
	
	"With configuration TLProjectMap version: ConfigurationOfTelescope project development"
	
	^ TLProjectMap version: BaselineOfIceberg project version
]

{ #category : #demos }
TLDemos class >> exampleRecursiveCompositeNode [
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
]

{ #category : #demos }
TLDemos class >> exampleSortingChildren [
	<script: 'self exampleSortingChildren open'>
	<tlFilter: #composite>
	| visualization |
	visualization := TLVisualization new.
	
	visualization nodeCreationStrategy
		compositeProperty: [ :entity | entity methods ];
		compositeChildrenLayout: (TLLinearLayout gap: 50 ratio: 16 / 9);
		childrenSortingStrategy:
			((TLPropertyBasedStrategy onProperty: [ :method | method numArgs ])
				descending;
				yourself).
				
	visualization addNodesFromEntities: TLConnectable withAllSubclasses.
	
	visualization styleSheet
		layout: (TLLinearLayout gap: 200 ratio: 16 / 9);
		nodeLabel: #asString position: #top;
		compositeExpandedByDefault: true;
		backgroundColor: [ :class | MDLColor transparent ].
	(visualization styleSheet > #node)
		nodeLabel: #selector position: #top;
		width: [ :method | method numArgs * 30 + 30 ];
		backgroundColor: [ :method | (Color wheel: 10) at: method numArgs + 1 ].
		
	^ visualization
]

{ #category : #demos }
TLDemos class >> exampleSystemComplexity [
	<script: 'self exampleSystemComplexity open'>
	<tlFilter: #visuTemplate>
	| visualization |
	visualization := TLSystemComplexity new
		root: Collection;
		property: #subclasses.
	visualization addInteraction: TLPopUpAction onMouseOver.
	^ visualization
]

{ #category : #demos }
TLDemos class >> exampleSystemComplexityInContainer [
	<script: 'self exampleSystemComplexityInContainer open'>
	<tlFilter: #visuTemplate>
	| visualization |
	visualization := TLSystemComplexity new
		root: Collection;
		property: #subclasses;
		container: #package.
	visualization addInteraction: (TLPopUpAction text: [ :entity | entity name ]) onMouseOver propagateToChildren.
	^ visualization
]

{ #category : #demos }
TLDemos class >> exampleSystemComplexityMultipleRoots [
	<script: 'self exampleSystemComplexityMultipleRoots open'>
	<tlFilter: #visuTemplate>
	
	"for FAMIXTypeGroup:
	 TLSystemComplexityMultipleRoots new
		roots: self asCollection;
		widthBlock: [ :each | each numberOfAttributes max: 5 ];
		heightBlock: [ :each | each numberOfMethods max: 5 ];
		backgroundColorBlock: #numberOfLinesOfCode;
		property: #directSubclasses;
		open."
	
	| visualization |
	visualization := TLSystemComplexityMultipleRoots new
		roots: Collection withAllSubclasses;
		widthBlock: [ :each | (each instanceVariables size) * 10 ];
		heightBlock: [ :each | each numberOfMethods * 3 ];
		backgroundColorBlock: #linesOfCode;
		property: #subclasses;
		scopeBlock: #yourself.
	visualization addInteraction: TLPopUpAction onMouseOver.
	^ visualization
]

{ #category : #'not working demos' }
TLDemos class >> exampleTreeExplorerCollectionHierarchy [
	"<script: 'self exampleTreeExplorerCollectionHierarchy open'>
	<tlFilter: #visuTemplate>
"
	| visualization |
	self flag: #clean.	"BROKEN FOR NOW. Because of triggers"
	visualization := TLTreeExplorer root: Collection expandProperty: #subclasses.

	visualization addInteraction: TLPopUpAction onMouseOver.
	^ visualization
]

{ #category : #'multi-visus-demos' }
TLDemos class >> exampleTwoConnectedVisualization [
	<script: 'self exampleTwoConnectedVisualization'>
	| visu1 visu2 |
	self flag: #todo.	"See how to add this visu in Cytoscape demos."
	visu1 := TLVisualization new.
	visu2 := TLVisualization new.
	visu1 styleSheet nodeLabel: #name.
	visu2 styleSheet nodeLabel: #name.
	visu1 addNodesFromEntities: (1 to: 5).
	visu2 addNodesFromEntities: (-5 to: -1).
	visu1 addInteraction: ((TLStyleCustomizationAction custom: [ :style | style backgroundColor: Color red ] target: [ :aNode | visu2 nodeForEntity: aNode entity negated ]) updateAlso: visu2) onClick.
	visu2
		addInteraction: ((TLStyleCustomizationAction custom: [ :style | style backgroundColor: Color green ] target: [ :aNode | visu1 nodeForEntity: aNode entity negated ]) updateAlso: visu1) onClick.
	visu1 open.
	visu2 open
]

{ #category : #demos }
TLDemos class >> exampleVisualizationWithCompositeChildrenConnectionsShowing [
	<script: 'self exampleVisualizationWithCompositeChildrenConnectionsShowing open'>
	<tlFilter: #interaction>
	<tlFilter: #composite>
	<tlFilter: #legend>
	| visualization node1 node2 |
	visualization := TLVisualization new.
	visualization styleSheet
		nodeLabel: #value;
		childrenLayout: (TLLinearLayout gap: 20 ratio: 9 / 16).
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
	visualization
		addInteraction: TLExpandCollapseCompositeNodeAction onCompositeNodeWithChildren onClick propagateToChildren;
		addInteraction: (TLStyleCustomizationAction custom: [ :d | d color: MDLColor red ] target: #incomingConnections) onMouseOver propagateToChildren;
		addInteraction: (TLStyleCustomizationAction custom: [ :d | d color: MDLColor blue ] target: #outgoingConnections) onMouseOver propagateToChildren.
	visualization legend
		description: 'Outgoing'
			forConnectionStyle:
			(TLStyleSheet new
				color: MDLColor blue;
				fontSize: '2em')
			icon: '→';
		description: 'Incoming'
			forConnectionStyle:
			(TLStyleSheet new
				color: MDLColor orange;
				fontSize: '2em')
			icon: '→'.
	^ visualization
]

{ #category : #accessing }
TLDemos class >> executeDemo: method [
	^ self perform: method 
]

{ #category : #'world menu' }
TLDemos class >> menuCommandOn: aBuilder [
	"Add a custom menu item to the world menu"

	<worldMenu>
	(aBuilder item: #'Open demo class')
		order: 1;
		iconName: #nautilus;
		parent: #Telescope;
		help: 'Browse the demo class of Telescope';
		action: [ self browse ]
]

{ #category : #'see class side' }
TLDemos >> seeClassSide [
]
