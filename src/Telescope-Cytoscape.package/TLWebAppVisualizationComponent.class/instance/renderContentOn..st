rendering
renderContentOn: html

	| component |
	component := (TLCytoscapeComponent visualization: webAppVisualization visualization ).
	html render: (component style: 'height: 500px; width:800px;').
