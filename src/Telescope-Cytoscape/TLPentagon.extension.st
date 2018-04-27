Extension { #name : #TLPentagon }

{ #category : #'*Telescope-Cytoscape' }
TLPentagon classSide >> forCytoscape [
	^ 'pentagon'
]

{ #category : #'*Telescope-Cytoscape' }
TLPentagon classSide >> forCytoscapeConnection [
	^ TLCytoscapeNotSupportedFunctionalityException signal: 'Impossible to put a pentagon on a connection'
]
