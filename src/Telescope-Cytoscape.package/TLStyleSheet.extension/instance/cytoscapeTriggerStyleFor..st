*Telescope-Cytoscape
cytoscapeTriggerStyleFor: aTrigger
	| nodeLabelPosition styleDictionary |
	nodeLabelPosition := self obtainValue: #nodeLabelPosition forEntity: nil.
	styleDictionary := Dictionary new.
	self
		fillStyleDictionary: styleDictionary
		with:
			{('border-color' -> #borderColor).
			('border-width' -> #borderWidth).
			(#width -> #width).
			(#height -> #height).
			('background-color' -> #backgroundColor).
			(#label -> #nodeLabel).
			(#shape -> #shape)}
		for: nil
		converter: #forCytoscapeNode.
	styleDictionary
		at: 'text-halign' put: nodeLabelPosition horizontal;
		at: 'text-valign' put: nodeLabelPosition vertical.
	^ styleDictionary