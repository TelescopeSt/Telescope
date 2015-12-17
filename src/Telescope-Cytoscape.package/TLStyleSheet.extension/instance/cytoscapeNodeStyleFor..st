*Telescope-Cytoscape
cytoscapeNodeStyleFor: aNode
	| nodeLabelPosition styleDictionary |
	nodeLabelPosition := self obtainValue: #nodeLabelPosition forEntity: aNode entity.
	styleDictionary := Dictionary new.
	(self
		fillStyleDictionary: styleDictionary with:
			{('border-color' -> #borderColor).
			('border-width' -> #borderWidth).
			(#width -> #width).
			(#height -> #height).
			('background-color' -> #backgroundColor).
			(#label -> #nodeLabel).
			(#shape -> #shape)}
		for: aNode entity converter: #forCytoscapeNode).
	styleDictionary 
		at: 'text-halign' put: nodeLabelPosition horizontal;
		at: 'text-valign' put: nodeLabelPosition vertical.
	aNode isComposite ifTrue: [ self adaptStyleForComposite: styleDictionary ].
	^ styleDictionary 
	