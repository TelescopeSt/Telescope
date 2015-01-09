private
createChildrenNodes
	| result |
	result := (property rtValue: self entity) asOrderedCollection.
	result ifNotNil: [ result do: [ :anEntity | self addChildNode: (self childrenNodeBuilder buildNodeFromEntity: anEntity) ] ].
	self childrenConnectingProperty ifNotNil: [ self connectChildrenFollowingProperty: self childrenConnectingProperty ]
	