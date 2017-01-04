*Telescope-Cytoscape
cytoscapeNodeStyleFor: aNode
	| nodeLabelPosition styleDictionary |
	nodeLabelPosition := self obtainValue: #nodeLabelPosition forEntity: aNode entity inNode: aNode.
	styleDictionary := Dictionary new.
	self
		fillStyleDictionary: styleDictionary
		with:
			{('border-color' -> #borderColor).
			('border-opacity' -> [ :t | [ :e :n | (t obtainValue: #borderColor forEntity: e inNode: n) alpha ] ]).
			('border-width' -> #borderWidth).
			('border-style' -> #borderStyle).
			(#width -> #width).
			(#height -> #height).
			('background-color' -> #backgroundColor).
			('background-image' -> #backgroundImageUrl).
			('background-image-opacity' -> #backgroundImageOpacity).
			('background-opacity' -> [ :t | [ :e :n | (t obtainValue: #backgroundColor forEntity: e inNode: n) alpha ] ]).
			(#label -> #nodeLabel).
			(#shape -> #shape)}
		for: aNode
		converter: #forCytoscapeNode.
	styleDictionary
		at: 'text-halign' put: nodeLabelPosition horizontal;
		at: 'text-valign' put: nodeLabelPosition vertical.
	(aNode isComposite and: [ aNode hasChildrenToDisplay ])
		ifTrue: [ self adaptStyleForComposite: styleDictionary ].
	^ styleDictionary