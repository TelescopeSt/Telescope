final
compositeNodes
	^ self sourceSelect: [ :drawable | drawable isNode and: [ drawable isComposite ] ]