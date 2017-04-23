instance creation
onCompositeNodeWithChildren
	^ self condition: [ :drawable | drawable isNode and: [ drawable isComposite and: [ drawable hasChildren ] ] ]