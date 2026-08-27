"
A TLPentagon is an enum value for a Pentagon.

"
Class {
	#name : 'TLPentagon',
	#superclass : 'TLSimpleShape',
	#category : 'Telescope-Core-Shape',
	#package : 'Telescope-Core',
	#tag : 'Shape'
}

{ #category : 'instance creation' }
TLPentagon class >> polygonPoints [
	^ self regularPolygonePointsOfSize: 5
]
