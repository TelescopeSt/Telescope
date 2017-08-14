adding
addNodeIfNotPresentFromEntity: anElement
	^ self nodes detect: [ :n | n entity = anElement ] ifNone: [ self addNodeFromEntity: anElement ]