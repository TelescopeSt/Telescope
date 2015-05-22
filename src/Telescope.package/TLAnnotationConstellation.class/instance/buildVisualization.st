building
buildVisualization

	self title: 'Annotation Constellation'.
	
	( self > #stars ) styleSheet
		shape: TLEllipseShape;
		backgroundColor: ( Color veryLightGray alpha: 0.5 );
		borderColor: Color transparent.
		
	( self > #sun ) styleSheet
		shape: ( TLLabelShape new text: #name );
		color: Color gray;
		height: ( RTNFontLinearNormalizer 
			inContext: self annotations
			withCommand: [ :each | ( each instances 
				collectAsSet: [:inst | inst annotatedEntity typeScope])
				size max: 20] ).

	self > #stars addNodesFromEntities: self entityGroup.
	self > #sun addNodesFromEntities: ( self annotations 
		select: [ :each | each annotatedEntities notEmpty ] ).

	self 
		addInteraction: TLNodeBasicInteraction popup;
		"addInteraction: ( TLMenuInteraction new action: #mooseMenuMorph );"
		layout: RTForceBasedLayout.
	self edgeBuilder color: ( Color veryVeryLightGray alpha: 0.5 ).
	self connectFollowingProperty: [ :e | 
		( e isKindOf: FAMIXAnnotationType ) 
			ifTrue: [ e annotatedEntities collectAsSet: #typeScope ]
			ifFalse: [ nil ] ].