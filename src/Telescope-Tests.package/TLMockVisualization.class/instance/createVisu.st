as yet unclassified
createVisu
	| visu |
	visu := TLVisualization new.
	visu nodeCreationStrategy compositeProperty: (1 to: 10) asOrderedCollection.
	visu styleSheet
		childrenLayout: TLLinearLayout topToBottom;
		shape: TLEllipse;
		nodeLabel: #mooseName;
		backgroundColor: Color gray.
	visu styleSheet > #children backgroundColor: Color yellow.
	visu
		addInteraction: TLPopUpAction onMouseOver;
		addInteraction: (TLInspectAction withMenu: 'Inspect');
		addInteraction: TLNodeBasicInteraction draggable.
	visu addNodeFromEntity: 42.
	^ visu