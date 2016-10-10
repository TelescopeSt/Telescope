*Telescope-Cytoscape
cytoscapeTriggerStyleFor: aTrigger
	| nodeLabelPosition styleDictionary |
	nodeLabelPosition := self obtainValue: #nodeLabelPosition forEntity: nil inNode: aTrigger.
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
		for: aTrigger
		converter: #forCytoscapeNode.
	styleDictionary
		at: 'text-halign' put: nodeLabelPosition horizontal;
		at: 'text-valign' put: nodeLabelPosition vertical.
	^ styleDictionary