"
A TLSimpleShape is just a representation of a shape. It will be used as an enum because all properties are set in stylesheet.

"
Class {
	#name : #TLSimpleShape,
	#superclass : #TLObject,
	#category : #'Telescope-Core-Shape'
}

{ #category : #accessing }
TLSimpleShape class >> displayName [
	| shapeName |
	shapeName := self name allButFirst: 2.
	(shapeName endsWith: 'Shape')
		ifTrue: [ shapeName := shapeName allButLast: 5 ].
	^ shapeName capitalized
]

{ #category : #'instance creation' }
TLSimpleShape class >> new [
	self error: 'you should not create instance of shapes, just use it as enum value'
]

{ #category : #'instance creation' }
TLSimpleShape class >> polygonPoints [
	"In order to define some shapes, framworks can take a set of points. This method should return a collection of points ranging on [-1, 1]. This represents the points in the polygon for the node’s shape. The bounding box of the node is given by 
	- Top left: (-1, 1)
	- Top right: (1, 1)
	- Bottom right: (1, -1)
	- Bottom left: (-1, -1)."

	^ self subclassResponsibility
]
