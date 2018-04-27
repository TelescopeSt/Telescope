Extension { #name : #TLLineStyle }

{ #category : #'*Telescope-Cytoscape' }
TLLineStyle classSide >> forCytoscape [
	"I should return a symbol that will be the cytoscape parameter for this kind of style."

	^ self subclassResponsibility
]
