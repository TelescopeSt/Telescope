Extension { #name : #TLFolderShape }

{ #category : #'*Telescope-Cytoscape' }
TLFolderShape classSide >> cytoscapeAttribute [
	^ #'shape-polygon-points'
]

{ #category : #'*Telescope-Cytoscape' }
TLFolderShape classSide >> forCytoscapeConnection [
	^ TLCytoscapeNotSupportedFunctionalityException signal: 'Impossible to put a folder shape on a connection'
]
