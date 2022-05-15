"
A TTLDrawableCollection is a trait that extend collection for specific stuff about nodes, composite and telescope specific logic.

"
Trait {
	#name : #TTLDrawableCollection,
	#category : #'Telescope-Core-Model'
}

{ #category : #interactions }
TTLDrawableCollection >> addInteractions: aCollectionOfInteractions [ 
	aCollectionOfInteractions do: [ :anInteraction | self addInteraction: anInteraction ]
]

{ #category : #compositeAccessing }
TTLDrawableCollection >> allChildrenNodes [
	^ self
		collection flatCollect: [ :aDrawable | 
			(aDrawable isNode and: [ aDrawable isComposite ])
				ifTrue: [ aDrawable childrenNodes ]
				ifFalse: [ {} ] ]
]

{ #category : #accessing }
TTLDrawableCollection >> allConnections [
	^ self collection allConnections
]

{ #category : #accessing }
TTLDrawableCollection >> allNodes [
	^ TLDrawableCollection new
		in: [ :coll | 
			self allNodesDo: [ :node | coll addLast: node ].
			coll ]
]

{ #category : #enumerating }
TTLDrawableCollection >> allNodesDo: aBlock [
	self collection allNodesDo: aBlock
]

{ #category : #enumerating }
TTLDrawableCollection >> allNodesRecursively [
	^ TLDrawableCollection new
		in: [ :coll | 
			self allNodesRecursivelyDo: [ :node | coll addLast: node ].
			coll ]
]

{ #category : #enumerating }
TTLDrawableCollection >> allNodesRecursivelyDo: aBlock [
	self collection allNodesRecursivelyDo: aBlock
]

{ #category : #requirements }
TTLDrawableCollection >> collection [
	self explicitRequirement
]

{ #category : #accessing }
TTLDrawableCollection >> conditionalRemove: aBlock [
	(self collection select: aBlock) do: [ :node | self remove: node ]
]

{ #category : #connect }
TTLDrawableCollection >> connectFromNode: aTLNode [
	^ self flatCollect: [ :aTLDrawable | (aTLDrawable connectFromNode: aTLNode) asTLDrawableCollection ]
]

{ #category : #connect }
TTLDrawableCollection >> connectFromNode: aTLNode entity: anObject [
	^ self
		flatCollect: [ :aTLDrawable | 
			(aTLDrawable connectFromNode: aTLNode entity: anObject)
				asTLDrawableCollection ]
]

{ #category : #connect }
TTLDrawableCollection >> connectIfNotFromNode: aTLNode [
	^ self flatCollect: [ :aTLDrawable | (aTLDrawable connectIfNotFromNode: aTLNode) asTLDrawableCollection ]
]

{ #category : #connect }
TTLDrawableCollection >> connectIfNotTo: aTLEntity [
	^ self flatCollect: [ :aLocalTLEntity | (aLocalTLEntity connectIfNotTo: aTLEntity) asTLDrawableCollection ]
]

{ #category : #connect }
TTLDrawableCollection >> connectTo: aTLEntity [
		^ self flatCollect: [:aLocalTLEntity | (aLocalTLEntity connectTo: aTLEntity) asTLDrawableCollection ]
]

{ #category : #connect }
TTLDrawableCollection >> connectTo: aTLEntity entity: anObject [
		^ self flatCollect: [:aLocalTLEntity | (aLocalTLEntity connectTo: aTLEntity entity: anObject) asTLDrawableCollection ]
]

{ #category : #connection }
TTLDrawableCollection >> connectToNode: aTLSimpleNode entity: anObject [ 
	^ self flatCollect: [:aLocalTLEntity | (aLocalTLEntity connectToNode: aTLSimpleNode entity: anObject) asTLDrawableCollection ]
]

{ #category : #entities }
TTLDrawableCollection >> entities [
	^ self nodesCollect: #entity.
]

{ #category : #'nodes-entity' }
TTLDrawableCollection >> nodeForEntity: anEntity [
	^ self nodeForEntity: anEntity ifAbsent: [ NotFound signalFor: anEntity ]
]

{ #category : #'nodes-entity' }
TTLDrawableCollection >> nodeForEntity: anEntity ifAbsent: aBlock [
	^ self nodes
		detect: [ :aTLEntity | aTLEntity entity = anEntity ]
		ifNone: [ 
			self subGroups
				do: [ :aSubgroup | 
					[ ^ aSubgroup nodeForEntity: anEntity ]
						on: NotFound
						do: [  ] ].
			aBlock value ]
]

{ #category : #accessing }
TTLDrawableCollection >> nodes [
	^ self collection
		select: #isNode
]

{ #category : #enumerating }
TTLDrawableCollection >> nodesCollect: aBlock [
	^ self collection
		nodesCollect: aBlock
]

{ #category : #enumerating }
TTLDrawableCollection >> nodesDo: aBlock [
	^ self collection
		nodesDo: aBlock
]

{ #category : #accessing }
TTLDrawableCollection >> nodesForEntities: aCollectionOfEntities [
	^ self flatCollect: [ :aTelescopeEntity | aTelescopeEntity nodesForEntities: aCollectionOfEntities ]
]

{ #category : #accessing }
TTLDrawableCollection >> obtain [
	^ TLObtainRequest source: self
]

{ #category : #sugar }
TTLDrawableCollection >> parentNodes [
	^ self collection select: [ :drawable | drawable parentNode notNil ] thenCollect: #parentNode
]

{ #category : #removing }
TTLDrawableCollection >> removeAllConnections [
	self allNodesRecursivelyDo: #removeAllConnections
]

{ #category : #accessing }
TTLDrawableCollection >> subGroups [
	^ self collection
		select: #isGroup
]
