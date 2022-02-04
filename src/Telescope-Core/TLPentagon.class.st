"
A TLPentagon is an enum value for a Pentagon.

"
Class {
	#name : #TLPentagon,
	#superclass : #TLSimpleShape,
	#category : #'Telescope-Core-Shape'
}

{ #category : #'instance creation' }
TLPentagon class >> polygonPoints [
	^ self regularPolygonePointsOfSize: 5
]
