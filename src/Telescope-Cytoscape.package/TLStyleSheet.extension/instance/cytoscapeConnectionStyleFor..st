*Telescope-Cytoscape
cytoscapeConnectionStyleFor: aConnection
	| styleDictionary |
	styleDictionary := Dictionary new.
	self
		fillStyleDictionary: styleDictionary
		with:
			{(#width -> #width).
			(#'line-color' -> #color).
			(#'line-style' -> #connectionStyle).
			(#label -> #connectionLabel).
			(#'curve-style' -> #curveStyle).
			(#'line-style' -> #connectionLineStyle).
			(#'font-size' -> #connectionLabelSize)}
		for: aConnection
		converter: #forCytoscapeConnection.
	{(#base -> #'source-arrow-').
	(#middleReversed -> #'mid-source-arrow-').
	(#head -> #'target-arrow-').
	(#middle -> #'mid-target-arrow-')}
		do: [ :substyleAndCytoStyle | 
			(self copyWithout: #(#shape)) + (self > substyleAndCytoStyle key)
				fillStyleDictionary: styleDictionary
				with:
					{((substyleAndCytoStyle value , #color) -> #color).
					((substyleAndCytoStyle value , #shape) -> #shape)}
				for: aConnection
				converter: #forCytoscapeConnection ].
	^ styleDictionary