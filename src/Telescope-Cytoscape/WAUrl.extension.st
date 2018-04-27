Extension { #name : #WAUrl }

{ #category : #'*Telescope-Cytoscape' }
WAUrl >> asUrl [
	^ String streamContents: [ :s | self printOn: s ]
]
