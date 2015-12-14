*Telescope-Cytoscape
cytoscapeConnectionStyleFor: anEntity
	| styleDictionary |
	styleDictionary := Dictionary new.
	self
		fillStyleDictionary: styleDictionary
		with:
			{(#width -> #width).
			('line-color' -> #color).
			('line-style' -> #style).
			('source-arrow-text' -> #connectionLabel).
			('curve-style' -> #curveStyle).
			(#label -> #label)}
		for: anEntity converter: #forCytoscapeConnection.
	{(#base -> 'source-arrow-').
	(#middleReversed -> 'mid-source-arrow-').
	(#head -> 'target-arrow-').
	(#middle -> 'mid-target-arrow-')}
		do: [ :substyleAndCytoStyle | 
			(self copyWithout: #(shape)) + (self > substyleAndCytoStyle key)
				fillStyleDictionary: styleDictionary
				with:
					{((substyleAndCytoStyle value , #color) -> #color).
					((substyleAndCytoStyle value , #shape) -> #shape)}
				for: anEntity converter: #forCytoscapeConnection].
	^ styleDictionary