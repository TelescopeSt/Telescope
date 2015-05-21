private
createChildrenNodes
	| result |
	result := [ (self property rtValue: self entity) asOrderedCollection ]
		on: KeyNotFound
		do: [ {} ].
	result
		ifNotNil: [ result do: [ :anEntity | self addChildNode: (self childrenNodeBuilder buildNodeFromEntity: anEntity) ] ]	"self childrenConnectingProperty ifNotNil: [ self connectChildrenFollowingProperty: self childrenConnectingProperty ]"