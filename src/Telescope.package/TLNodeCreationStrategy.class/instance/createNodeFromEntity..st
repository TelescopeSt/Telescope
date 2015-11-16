node-creation
createNodeFromEntity: anEntity
	^ self requireCompositeCreation
		ifTrue: [ TLCompositeNode withEntity: anEntity childrenProperty: self compositeProperty childrenNodeCreationStrategy: self childrenStrategy ]
		ifFalse: [ TLSimpleNode withEntity: anEntity ]