"
A shape of the form of a file
"
Class {
	#name : #TLFileShape,
	#superclass : #TLSimpleShape,
	#category : #'Telescope-Core-Shape'
}

{ #category : #'instance creation' }
TLFileShape class >> polygonPoints [
	^ {(-1 @ 1).
	(0.3 @ 1).
	(1 @ 0.3).
	(1 @ -1).
	(-1 @ -1)}
]
