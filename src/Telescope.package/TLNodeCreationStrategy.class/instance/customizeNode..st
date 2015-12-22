node-creation
customizeNode: node
	(node isComposite and: self compositeChildrenLayout notNil)
		ifTrue: [ node childrenLayout: self compositeChildrenLayout ].
	self nodeStyle ifNotNil: [ node addStyle: self nodeStyle ]