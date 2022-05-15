"
A TLRectangle is an enum value for rectangle.

"
Class {
	#name : #TLRectangle,
	#superclass : #TLSimpleShape,
	#category : #'Telescope-Core-Shape'
}

{ #category : #'instance creation' }
TLRectangle class >> polygonPoints [
	^ self regularPolygonePointsOfSize: 4
]
