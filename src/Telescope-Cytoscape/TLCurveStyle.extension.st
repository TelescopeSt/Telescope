Extension { #name : #TLCurveStyle }

{ #category : #'*Telescope-Cytoscape' }
TLCurveStyle classSide >> forCytoscape [
	"I should return a symbol that will be the cytoscape parameter for this kind of style."

	^ self subclassResponsibility
]
