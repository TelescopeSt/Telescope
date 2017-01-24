node-creation
customizeNode: node
	(node isComposite and: self compositeChildrenLayout notNil)
		ifTrue: [ node childrenLayout: self compositeChildrenLayout ].
	self nodeStyle
		ifNotNil: [ 
			node
				addStyle:
					(self nodeStyle isBlock
						ifTrue: [ self nodeStyle cull: node entity cull: node ]
						ifFalse: self nodeStyle) ]