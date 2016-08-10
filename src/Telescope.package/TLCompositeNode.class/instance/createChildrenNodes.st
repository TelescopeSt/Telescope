private
createChildrenNodes
	self areChildrenGenerated
		ifTrue: [ TLCompositeChildrenAlreadyGeneratedException signal ]
		ifFalse: [ self state at: #childrenGenerated put: true ].
	self childrenProperty ifNil: [ TLNoChildrenPropertyException signal ].
	childrenGroup
		addNodesFromEntities:
			([ self childrenProperty cull: self entity ]
				on: MessageNotUnderstood
				do: [ self childrenProperty ]) asOrderedCollection