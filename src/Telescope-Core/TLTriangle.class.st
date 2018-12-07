"
A TLTriangle is an enum value for triangle.

"
Class {
	#name : #TLTriangle,
	#superclass : #TLSimpleShape,
	#category : #'Telescope-Core-Shape'
}

{ #category : #'instance creation' }
TLTriangle class >> polygonPoints [
	^ {(0 @ 1).
	(1 @ -1).
	(-1 @ -1)}
]
