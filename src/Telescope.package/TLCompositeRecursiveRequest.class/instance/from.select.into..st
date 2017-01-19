iterating
from: collection select: aBlockClosure into: selection
	collection
		do: [ :aDrawable | 
			(aBlockClosure value: aDrawable)
				ifTrue: [ selection add: aDrawable ].
			(aDrawable isCompositeNode and: [ self compositeDeserveVisit: aDrawable ])
				ifTrue: [ self from: aDrawable childrenGroup select: aBlockClosure into: selection ] ]