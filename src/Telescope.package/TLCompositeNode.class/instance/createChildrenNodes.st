private
createChildrenNodes
	self childrenProperty ifNil: [TLNoChildrenPropertyException signal].
	childrenGroup
		addNodesFromEntities:
			([ self childrenProperty cull: self entity ]
				on: MessageNotUnderstood
				do: [ self childrenProperty ]) asOrderedCollection