Extension { #name : #TLSquare }

{ #category : #'*Telescope-Cytoscape' }
TLSquare classSide >> forCytoscapeConnection [
	^ 'square'
]

{ #category : #'*Telescope-Cytoscape' }
TLSquare classSide >> forCytoscapeNode [
	^ TLCytoscapeNotSupportedFunctionalityException signal: 'Square is only for connections; use rectangle'
]
