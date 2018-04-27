Extension { #name : #TLSimpleShape }

{ #category : #'*Telescope-Cytoscape' }
TLSimpleShape classSide >> availableForCytoscapeConnection [
	^ [ 
	self forCytoscapeConnection.
	true ]
		on: TLCytoscapeNotSupportedFunctionalityException
		do: [ false ]
]

{ #category : #'*Telescope-Cytoscape' }
TLSimpleShape classSide >> cytoscapeAttribute [
	^ #shape
]

{ #category : #'*Telescope-Cytoscape' }
TLSimpleShape classSide >> cytoscapePolygonPoints [
	^ self cytoscapePolygonPointsFrom: self polygonPoints
]

{ #category : #'*Telescope-Cytoscape' }
TLSimpleShape classSide >> cytoscapePolygonPointsFrom: aCollectionOfPoints [
	"This method takes the polygon points representation of the shape and return a string describing the shape as Cytoscape can interpret it."

	| pointsInNewReferentiel |
	"Cytoscape does not have the same way to represent coordanates than Telescope so we convert them."
	pointsInNewReferentiel := aCollectionOfPoints collect: [ :point | Point x: point x y: point y negated ].
	^ String
		streamContents: [ :aStream | 
			pointsInNewReferentiel
				do: [ :point | 
					aStream
						nextPutAll: point x asString;
						nextPutAll: ', ';
						nextPutAll: point y asString ]
				separatedBy: [ aStream nextPutAll: ', ' ] ]
]

{ #category : #'*Telescope-Cytoscape' }
TLSimpleShape classSide >> forCytoscapeNode [
	^ self cytoscapeAttribute = #shape
		ifTrue: [ super forCytoscapeNode ]
		ifFalse: [ self cytoscapePolygonPoints ]
]

{ #category : #'*Telescope-Cytoscape' }
TLSimpleShape classSide >> iconName [
	| shapeName |
	shapeName := self name allButFirst: 2.
	(shapeName endsWith: 'Shape')
		ifTrue: [ shapeName := shapeName allButLast: 5 ].
	^ shapeName capitalized
]
