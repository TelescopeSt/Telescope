Extension { #name : #TLRightClickInteraction }

{ #category : #'*Telescope-Cytoscape' }
TLRightClickInteraction >> forCytoscapeFromNode: aTLNode [
	^ (self action forCytoscapeFromNode: aTLNode)
		at: 'show' put: {('event' -> #cxttap)} asDictionary;
		yourself
]
