"
A shape of the form of a folder
"
Class {
	#name : #TLFolderShape,
	#superclass : #TLSimpleShape,
	#category : #'Telescope-Core-Shape'
}

{ #category : #'instance creation' }
TLFolderShape class >> polygonPoints [
	^ {(-1 @ 0.6).
	(-0.8 @ 0.9).
	(-0.3 @ 0.9).
	(-0.1 @ 0.6).
	(1 @ 0.6).
	(1 @ -0.9).
	(-1 @ -0.9)}
]
