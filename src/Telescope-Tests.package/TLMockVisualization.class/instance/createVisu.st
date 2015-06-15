as yet unclassified
createVisu
	| visu |
	visu := TLVisualization new.
	visu styleSheet
		childrenProperty: (1 to: 10) asOrderedCollection;
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