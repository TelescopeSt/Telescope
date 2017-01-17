strategy
validate: aDrawable
	^ aDrawable isVisible
		and: [ 
			aDrawable isSimpleNode
				or: [ (aDrawable isCompositeNode and: [ aDrawable expanded not ]) or: [ aDrawable isGroup and: [ aDrawable isEmpty ] ] ] ]