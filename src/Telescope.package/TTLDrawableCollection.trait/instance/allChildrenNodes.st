compositeAccessing
allChildrenNodes
	^ self
		collection flatCollect: [ :aDrawable | 
			(aDrawable isNode and: [ aDrawable isComposite ])
				ifTrue: [ aDrawable childrenNodes ]
				ifFalse: [ {} ] ]