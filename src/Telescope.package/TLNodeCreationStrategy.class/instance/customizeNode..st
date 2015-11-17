node-creation
customizeNode: node
	self nodeStyle ifNotNil: [ node addStyle: self nodeStyle ]