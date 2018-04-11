*Telescope-Cytoscape
cytoscapeNodeStyleFor: aNode
	| nodeLabelPosition styleDictionary shape |
	nodeLabelPosition := self obtainValue: #nodeLabelPosition forEntity: aNode entity inNode: aNode.
	styleDictionary := Dictionary new.
	self
		fillStyleDictionary: styleDictionary
		with:
			{(#'border-color' -> #borderColor).
			(#'border-opacity' -> [ :t | [ :e :n | (t obtainValue: #borderColor forEntity: e inNode: n) alpha ] ]).
			(#'border-width' -> #borderWidth).
			(#'border-style' -> #borderStyle).
			(#width -> #width).
			(#height -> #height).
			(#'background-color' -> #backgroundColor).
			(#'background-image' -> #backgroundImageUrl).
			(#'background-image-opacity' -> #backgroundImageOpacity).
			(#'background-opacity' -> [ :t | [ :e :n | (t obtainValue: #backgroundColor forEntity: e inNode: n) alpha ] ]).
			(#label -> #nodeLabel).
			(#color -> #textColor).
			(#'font-size' -> #labelSize).
			(#'text-wrap' -> #nodeLabelWrap).
			(#'text-max-width' -> #nodeLabelMaxWidth)}
		for: aNode
		converter: #forCytoscapeNode.
	styleDictionary
		at: 'text-halign' put: nodeLabelPosition horizontal;
		at: 'text-valign' put: nodeLabelPosition vertical.
	shape := self obtainValue: #shape forEntity: aNode entity inNode: aNode.
	styleDictionary at: shape cytoscapeAttribute put: shape forCytoscapeNode.
	shape cytoscapeAttribute = #shape
		ifFalse: [ styleDictionary at: #shape put: #polygon ].
	(aNode isComposite and: [ aNode hasChildrenToDisplay ])
		ifTrue: [ self adaptStyleForComposite: styleDictionary ].
	"If we do not give an empty label to cytoscape when there is no label, it zill not remove a potential current label."
	styleDictionary at: 'label' ifAbsentPut: [ '' ].
	^ styleDictionary