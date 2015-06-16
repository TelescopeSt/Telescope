private
createChildrenNodes
	| result |
	"Halt if: [ entity notNil and: [[self property ~= #dependentClasses] on: KeyNotFound do: [false]]]."
	result := [ childrenGroup addNodesFromEntities: (( [ Halt if: [self property isNil].self property cull: self entity] on: MessageNotUnderstood do: [self property]) asOrderedCollection) ]
		on: KeyNotFound
		do: [  ].
	
	"self childrenConnectingProperty ifNotNil: [ self connectChildrenFollowingProperty: self childrenConnectingProperty ]"