"
A TLDiamond is an enum value for a Diamond.

"
Class {
	#name : #TLDiamond,
	#superclass : #TLSimpleShape,
	#category : #'Telescope-Core-Shape'
}

{ #category : #'instance creation' }
TLDiamond class >> polygonPoints [
	^ {(0 @ 1).
	(1 @ 0).
	(0 @ -1).
	(-1 @ 0)}
]
