node-creation
createNodeFromEntity: anEntity
	| node |
	node := self requireCompositeCreation
		ifTrue: [ 
			TLCompositeNode
				withEntity: anEntity
				childrenProperty: self compositeProperty
				childrenNodeCreationStrategy: self childrenStrategy ]
		ifFalse: [ TLSimpleNode withEntity: anEntity ].
	self customizeNode: node.
	^ node