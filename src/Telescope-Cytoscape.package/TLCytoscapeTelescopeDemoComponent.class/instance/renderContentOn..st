as yet unclassified
renderContentOn: html
	html text: 'Coucou'.
	html
		render:
			(TLCytoscapeComponent
				visualization:
					(TLDemos exampleButterflyUsingStyleFunctionnality)).
	html
		render:
			(TLCytoscapeComponent
				visualization:
					(TLDemos exampleAllShapes))