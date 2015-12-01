as yet unclassified
renderContentOn: html
	html text: 'Coucou'.
	html
		render:
			(TLCytoscapeComponent
				visualization:
					(TLVisualization new
						addNodesFromEntities: (1 to: 10);
						yourself)).
	html
		render:
			(TLCytoscapeComponent
				visualization:
					(TLVisualization new
						addNodesFromEntities: (1 to: 10);
						yourself))