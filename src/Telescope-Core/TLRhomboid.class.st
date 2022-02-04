"
A TLRhomboid is an enum value for a Rhomboid.

"
Class {
	#name : #TLRhomboid,
	#superclass : #TLSimpleShape,
	#category : #'Telescope-Core-Shape'
}

{ #category : #'instance creation' }
TLRhomboid class >> polygonPoints [
	^ {(-1 @ 1).
	(0.7 @ 1).
	(1 @ -1).
	(-0.7 @ -1)}
]
