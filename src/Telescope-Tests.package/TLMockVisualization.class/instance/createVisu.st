as yet unclassified
createVisu
	| visu |
	visu := TLVisualization new.
	visu nodeCreationStrategy compositeProperty: (1 to: 10) asOrderedCollection.
	visu styleSheet
		childrenLayout: (RTVerticalLineLayout withGap: 10);
		shape: TLEllipse;
		nodeLabel: #mooseName;
		backgroundColor: Color gray.
	visu styleSheet > #children backgroundColor: Color yellow.
	visu
		addInteraction: TLNodeBasicInteraction popup;
		addInteraction: (TLInspectAction withMenu: 'Inspect');
		addInteraction: TLNodeBasicInteraction draggable.
	visu addNodeFromEntity: 42.
	^ visu