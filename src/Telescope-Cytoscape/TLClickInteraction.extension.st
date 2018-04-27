Extension { #name : #TLClickInteraction }

{ #category : #'*Telescope-Cytoscape' }
TLClickInteraction >> forCytoscapeFromNode: aTLNode [
	^ (self action forCytoscapeFromNode: aTLNode)
		at: 'show' put: {('event' -> #tap)} asDictionary;
		yourself
]
