Extension { #name : #TLHexagon }

{ #category : #'*Telescope-Cytoscape' }
TLHexagon classSide >> forCytoscape [
	^ 'hexagon'
]

{ #category : #'*Telescope-Cytoscape' }
TLHexagon classSide >> forCytoscapeConnection [
	^ TLCytoscapeNotSupportedFunctionalityException signal: 'Impossible to put an hexagon on a connection'
]
