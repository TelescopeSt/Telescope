"
A TLOctagon is an enum value for an Octagon.

"
Class {
	#name : #TLOctagon,
	#superclass : #TLSimpleShape,
	#category : #'Telescope-Core-Shape'
}

{ #category : #'instance creation' }
TLOctagon class >> polygonPoints [
	^ self regularPolygonePointsOfSize: 8
]
