"
a TLArrow is an enum for a triangle with a curve. It can only be used on connections 
"
Class {
	#name : 'TLArrow',
	#superclass : 'TLSimpleShape',
	#category : 'Telescope-Core-Shape',
	#package : 'Telescope-Core',
	#tag : 'Shape'
}

{ #category : 'instance creation' }
TLArrow class >> polygonPoints [
	"A triangle whose base is curved inwards"

	^ {
		  (0 @ 1).
		  (1 @ -1).
		  (0 @ -0.4).
		  (-1 @ -1) }
]
