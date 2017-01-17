strategy
validate: aDrawable
	^ aDrawable isVisible
		and: [ (aDrawable isCompositeNode and: [ aDrawable expanded not ]) or: [ aDrawable isGroup and: [ aDrawable isEmpty ] ] ]