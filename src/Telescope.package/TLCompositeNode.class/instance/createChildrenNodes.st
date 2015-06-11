private
createChildrenNodes
	| result |
	"Halt if: [ entity notNil and: [[self property ~= #dependentClasses] on: KeyNotFound do: [false]]]."
	result := [ childrenGroup addNodesFromEntities: (( self property cull: self entity) asOrderedCollection) ]
		on: KeyNotFound
		do: [ {} ].
	
	"self childrenConnectingProperty ifNotNil: [ self connectChildrenFollowingProperty: self childrenConnectingProperty ]"