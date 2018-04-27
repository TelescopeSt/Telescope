Extension { #name : #TLFileShape }

{ #category : #'*Telescope-Cytoscape' }
TLFileShape classSide >> cytoscapeAttribute [
	^ #'shape-polygon-points'
]

{ #category : #'*Telescope-Cytoscape' }
TLFileShape classSide >> forCytoscapeConnection [
	^ TLCytoscapeNotSupportedFunctionalityException signal: 'Impossible to put a file shape on a connection'
]
