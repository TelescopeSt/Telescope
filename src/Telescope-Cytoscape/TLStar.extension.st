Extension { #name : #TLStar }

{ #category : #'*Telescope-Cytoscape' }
TLStar classSide >> forCytoscape [
	^ 'star'
]

{ #category : #'*Telescope-Cytoscape' }
TLStar classSide >> forCytoscapeConnection [
	^ TLCytoscapeNotSupportedFunctionalityException signal: 'Impossible to put a star on a connection'
]
