private
createChildrenNodes
	self areChildrenGenerated
		ifTrue: [ TLCompositeChildrenAlreadyGeneratedException signal ]
		ifFalse: [ childrenGenerated := true ].
	self childrenProperty ifNil: [ TLNoChildrenPropertyException signal ].
	childrenGroup
		addNodesFromEntities:
			([ self childrenProperty cull: self entity ]
				on: MessageNotUnderstood
				do: [ self childrenProperty ]) asOrderedCollection