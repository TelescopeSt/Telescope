private
createChildrenNodes
	| result |
	result := [ childrenGroup addNodesFromEntities: ((self property rtValue: self entity) asOrderedCollection) ]
		on: KeyNotFound
		do: [ {} ].
	
	"self childrenConnectingProperty ifNotNil: [ self connectChildrenFollowingProperty: self childrenConnectingProperty ]"