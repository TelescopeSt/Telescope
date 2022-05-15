"
A TTLConnectable is a trait that define API to connect TLEntities together.

"
Trait {
	#name : #TTLConnectable,
	#category : #'Telescope-Core-Model'
}

{ #category : #connect }
TTLConnectable >> connectFollowingProperty: aBlockOrSymbol [
	^ self connectFollowingProperty: aBlockOrSymbol context: self
]

{ #category : #connect }
TTLConnectable >> connectFollowingProperty: aBlockOrSymbol context: aTLEntitiesGroup [
	^ self flatCollect: [ :tlEntity | tlEntity connectFollowingProperty: aBlockOrSymbol context: aTLEntitiesGroup ]
]

{ #category : #connect }
TTLConnectable >> connectFrom: aTLEntity [
	^ aTLEntity connectTo: self
]

{ #category : #connect }
TTLConnectable >> connectFrom: aTLEntity entity: anObject [
	^ aTLEntity connectTo: self entity: anObject
]

{ #category : #connect }
TTLConnectable >> connectIfNotAlreadyFollowingProperty: aBlockOrSymbol [
	^ self connectIfNotAlreadyFollowingProperty: aBlockOrSymbol context: self
]

{ #category : #connect }
TTLConnectable >> connectIfNotAlreadyFollowingProperty: aBlockOrSymbol context: aTLEntitiesGroup [
	^ self flatCollect: [ :tlEntity | tlEntity connectIfNotFollowingProperty: aBlockOrSymbol context: aTLEntitiesGroup ]
]

{ #category : #connect }
TTLConnectable >> connectIfNotFollowingProperty: aBlockOrSymbol [
	self
		deprecated: 'The name of this method is not repersentative of what it does, please use #connectIfNotAlreadyFollowingProperty: instead.'
		transformWith: '`@receiver connectIfNotFollowingProperty: `@statements1' -> '`@receiver connectIfNotAlreadyFollowingProperty: `@statements1'.
	^ self connectIfNotAlreadyFollowingProperty: aBlockOrSymbol
]

{ #category : #connect }
TTLConnectable >> connectIfNotFollowingProperty: aBlockOrSymbol context: aTLEntitiesGroup [
	self
		deprecated: 'The name of this method is not repersentative of what it does, please use #connectIfNotAlreadyFollowingProperty:context: instead.'
		transformWith:
			'`@receiver connectIfNotFollowingProperty: `@statements1 context: `@statements2'
				-> '`@receiver connectIfNotAlreadyFollowingProperty: `@statements1 context: `@statements2'.
	^ self connectIfNotAlreadyFollowingProperty: aBlockOrSymbol context: aTLEntitiesGroup
]

{ #category : #connect }
TTLConnectable >> connectIfNotTo: aTLEntity [
	^ self explicitRequirement
]

{ #category : #connect }
TTLConnectable >> connectIfNotToAll: aCollectionOfTLEntity [
	^ aCollectionOfTLEntity collect: [ :aTLEntity | self connectIfNotTo: aTLEntity ]
]

{ #category : #connect }
TTLConnectable >> connectThrough: connectionsValuable to: targetValuable [
	"Specify how nodes are connected. ==connectionsValuable== is a 1-arg block (or symbol) that must return a collection of the model's connection entities for a given model's node. ==targetValuable== is a 1-arg block (or symbol) that must return the target model's node for a given model's connection entity. The idea is that ==targetValuable== will be evaluated for each element returned by the evaluation of ==connectionsValuable==."
	^ self connectThrough: connectionsValuable to: targetValuable context: self
]

{ #category : #connect }
TTLConnectable >> connectThrough: connectionsValuable to: targetValuable context: aTLEntitiesGroup [
	^ self flatCollect: [ :tlEntity | tlEntity connectThrough: connectionsValuable to: targetValuable context: aTLEntitiesGroup ]
]

{ #category : #connect }
TTLConnectable >> connectTo: aTLEntity [
	^ self explicitRequirement
]

{ #category : #connect }
TTLConnectable >> connectTo: aTLEntity entity: anObject [
	^ self explicitRequirement
]

{ #category : #connect }
TTLConnectable >> connectToAll: aCollectionOfTLEntity [
	^ aCollectionOfTLEntity collect: [:aTLEntity | self connectTo: aTLEntity ]
]
