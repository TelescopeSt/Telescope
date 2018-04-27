Extension { #name : #TLCircle }

{ #category : #'*Telescope-Cytoscape' }
TLCircle classSide >> forCytoscapeConnection [
	^ 'circle'
]

{ #category : #'*Telescope-Cytoscape' }
TLCircle classSide >> forCytoscapeNode [
	^ TLCytoscapeNotSupportedFunctionalityException signal: 'Circle is only for connections; use Ellipse'
]
