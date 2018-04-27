Extension { #name : #TLHeptagon }

{ #category : #'*Telescope-Cytoscape' }
TLHeptagon classSide >> forCytoscape [
	^ 'heptagon'
]

{ #category : #'*Telescope-Cytoscape' }
TLHeptagon classSide >> forCytoscapeConnection [
	^ TLCytoscapeNotSupportedFunctionalityException signal: 'Impossible to put an heptagon on a connection'
]
