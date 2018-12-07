"
A TLHexagon is an enum value for a Hexagon.

"
Class {
	#name : #TLHexagon,
	#superclass : #TLSimpleShape,
	#category : #'Telescope-Core-Shape'
}

{ #category : #'instance creation' }
TLHexagon class >> polygonPoints [
	^ self regularPolygonePointsOfSize: 6
]
