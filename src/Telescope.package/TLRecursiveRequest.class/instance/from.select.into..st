iterating
from: collection select: aBlockClosure into: selection
	collection
		do: [ :aDrawable | 
			(aBlockClosure value: aDrawable)
				ifTrue: [ selection add: aDrawable ].
			aDrawable isGroup
				ifTrue: [ self from: aDrawable select: aBlockClosure into: selection ].
			aDrawable isCompositeNode
				ifTrue: [ self from: aDrawable childrenGroup select: aBlockClosure into: selection ] ]