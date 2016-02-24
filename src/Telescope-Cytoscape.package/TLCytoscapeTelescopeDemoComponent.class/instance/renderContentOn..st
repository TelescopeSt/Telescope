as yet unclassified
renderContentOn: html
	| divStyle visualization |
	divStyle := [ :visu | 'width: ' , visu openingDimension x asString , 'px; height: ' , visu openingDimension y asString , 'px; display: block;' ].
	html text: 'Coucou'.
	visualization := TLVisualization new.
	visualization
		addCompositeNodeFromEntity: Collection children: (Collection subclasses first: 2);
		addCompositeDefaultCollapseInteraction.
	visualization styleSheet expandCompositeNodes.
	html div
		style: (divStyle value: visualization);
		with: [ html render: (TLCytoscapeComponent visualization: visualization) ]