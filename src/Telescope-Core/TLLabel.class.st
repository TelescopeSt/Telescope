"
A label shape
"
Class {
	#name : #TLLabel,
	#superclass : #TLSimpleShape,
	#category : #'Telescope-Core-Shape'
}

{ #category : #'instance creation' }
TLLabel class >> polygonPoints [
	^ {(-1 @ 0.7).
	(0.5 @ 0.7).
	(1 @ 0).
	(0.5 @ -0.7).
	(-1 @ -0.7)}
]
