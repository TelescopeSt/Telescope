iterating
from: collection select: aSelectBlock thenDo: aDoBlock
	collection
		do: [ :aDrawable | 
			(aSelectBlock value: aDrawable)
				ifTrue: [ aDoBlock cull: aDrawable ].
			aDrawable isGroup
				ifTrue: [ self from: aDrawable select: aSelectBlock thenDo: aDoBlock ] ]