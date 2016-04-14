as yet unclassified
renderContentOn: html
	| divStyle visua |
	divStyle := [ :visu | 'width: ' , (visu openingDimension x * 3) asString , 'px; height: ' , (visu openingDimension y * 3) asString , 'px; display: block;' ].
	selection ifNotNil: [ html text: 'Selection: ', selection asString ].
	visua := TLVisualization new
		addNodesFromEntities: (1 to: 10);
		addInteraction: (TLSeasideCallBackAction block: [ :node | selection := node entity ]) onClick;
		yourself.
	html div
		style: (divStyle value: visua);
		with: [ html render: (TLCytoscapeComponent visualization: visua) ].
	#(#exampleChangingLayout #examplePopUp exampleTelescopeLayouts)
		do: [ :visuName | 
			| visualization |
			visualization := TLDemos perform: visuName.
			html div
				style: (divStyle value: visualization);
				with: [ html render: (TLCytoscapeComponent visualization: visualization) ] ]	"#exampleLegend #exampleGradient #exampleChangingLayout #exampleCompositeExploringHierarchy #exampleSystemComplexityMultipleRoots #exampleHighlightElements #exampleMovingNodeToAnotherGroup #exampleButterflyUsingStyleFunctionnality #exampleConnectionStyle #exampleAllShapes"