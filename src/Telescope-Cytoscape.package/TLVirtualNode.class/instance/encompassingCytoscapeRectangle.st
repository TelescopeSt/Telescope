accessing
encompassingCytoscapeRectangle
	| encompassingCytoscapeRectangle |
	^ encompassingCytoscapeRectangle ifNil: [ encompassingCytoscapeRectangle := Rectangle origin: self cytoscapePosition extent: self dimension ]