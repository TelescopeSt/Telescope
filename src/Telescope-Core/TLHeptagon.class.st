"
A TLHeptagon is an enum value for a Heptagon.

"
Class {
	#name : #TLHeptagon,
	#superclass : #TLSimpleShape,
	#category : #'Telescope-Core-Shape'
}

{ #category : #'instance creation' }
TLHeptagon class >> polygonPoints [
	^ self regularPolygonePointsOfSize: 7
]
