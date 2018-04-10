*Telescope-Cytoscape
cytoscapePolygonPointsFrom: aCollectionOfPoints
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