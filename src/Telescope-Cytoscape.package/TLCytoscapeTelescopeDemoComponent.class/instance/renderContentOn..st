as yet unclassified
renderContentOn: html
	html text: 'Coucou'.
	html render: (TLCytoscapeComponent visualization: TLDemos exampleCompositeExploringHierarchy).
	html render: (TLCytoscapeComponent visualization: TLDemos exampleHighlightElements).
	html render: (TLCytoscapeComponent visualization: TLDemos exampleMovingNodeToAnotherGroup).
	html render: (TLCytoscapeComponent visualization: TLDemos exampleButterflyUsingStyleFunctionnality).
	html render: (TLCytoscapeComponent visualization: TLDemos exampleConnectionStyle).
	html render: (TLCytoscapeComponent visualization: TLDemos exampleAllShapes)