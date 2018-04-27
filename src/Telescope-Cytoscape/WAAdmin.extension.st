Extension { #name : #WAAdmin }

{ #category : #'*Telescope-Cytoscape' }
WAAdmin classSide >> isAnAppRegisteredAt: anObject [

	^self defaultDispatcher handlers includesKey: anObject .
]
