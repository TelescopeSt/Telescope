building
buildVisualization

	"general layout for class and its elements"
	self styleSheet
		childrenProperty: [ :aClass | { aClass . aClass }];
		childrenLayout: ( RTVerticalLineLayout new verticalGap: 0 );
		compositeExpandedByDefault: true;
		backgroundColor: Color white;
		borderColor: Color black;
		nodeLabel: #name position: #inside.
	
	"for variables and methods groups"
	( self styleSheet > #children )
		nodeClass: TLCompositeNode;
		borderColor: Color white;
		noNodeLabel.
	
	"for variables and methods separately"
	( self styleSheet > #children > #children )
		nodeLabel: #name;
		onlyLabelForNodes.
		
	self > #default addNodeFromEntity: self entity.
	self > #default nodesDo: [ :aClassNode |
		aClassNode childrenNodes first styleSheet childrenProperty: self attributesBlock.
		aClassNode childrenNodes second styleSheet childrenProperty: self methodsBlock. ]