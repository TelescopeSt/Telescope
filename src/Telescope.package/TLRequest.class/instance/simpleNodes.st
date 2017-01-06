final
simpleNodes
	^ self sourceSelect: [ :drawable | drawable isNode and: [ drawable isComposite not ] ]