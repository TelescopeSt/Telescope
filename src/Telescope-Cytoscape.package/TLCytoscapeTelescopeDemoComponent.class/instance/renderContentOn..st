as yet unclassified
renderContentOn: html
	| divStyle |
	divStyle := [ :visu | 'width: ' , visu openingDimension x asString , 'px; height: ' , visu openingDimension y asString , 'px; display: block;' ].
	
	html text: 'Coucou'.
	
	#(#exampleChangingLayout #exampleCompositeExploringHierarchy #exampleSystemComplexityMultipleRoots #exampleHighlightElements #exampleMovingNodeToAnotherGroup #exampleButterflyUsingStyleFunctionnality #exampleConnectionStyle #exampleAllShapes)
		do: [ :visuName | 
			| visualization |
			visualization := TLDemos perform: visuName.
			html div
				style: (divStyle value: visualization);
				with: [ html render: (TLCytoscapeComponent visualization: visualization) ] ]