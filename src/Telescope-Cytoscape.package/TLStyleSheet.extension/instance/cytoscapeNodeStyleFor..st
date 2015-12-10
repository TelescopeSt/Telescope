*Telescope-Cytoscape
cytoscapeNodeStyleFor: anEntity
	| nodeLabelPosition |
	nodeLabelPosition := self obtainValue: #nodeLabelPosition forEntity: anEntity.
	^ (self
		createStyleDictionaryWith:
			{('border-color' -> #borderColor).
			('border-width' -> #borderWidth).
			(#width -> #width).
			(#height -> #height).
			('background-color' -> #backgroundColor).
			(#label -> #nodeLabel).
			(#shape -> #shape)}
		for: anEntity)
		at: 'text-halign' put: nodeLabelPosition horizontal;
		at: 'text-valign' put: nodeLabelPosition vertical;
		yourself