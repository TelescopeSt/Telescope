"
I am an abstract class for all curve styles in Telescope
"
Class {
	#name : #TLCurveStyle,
	#superclass : #TLObject,
	#category : 'Telescope-Style'
}

{ #category : #'instance creation' }
TLCurveStyle class >> new [
	self error: 'you should not create instance of curve styles, just use it as enum value'
]
