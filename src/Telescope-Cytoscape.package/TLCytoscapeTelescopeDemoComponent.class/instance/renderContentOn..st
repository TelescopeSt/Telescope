as yet unclassified
renderContentOn: html
	| visu |
	visu := TLTreeExplorer root: Collection expandProperty: #subclasses.
	html render: ((TLCytoscapeComponent visualization: visu) style: 'height: 500px; width:800px;')