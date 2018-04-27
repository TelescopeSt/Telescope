"
Description
--------------------

I am an abstract class to define some line style. Those line style will be used for the connections or borders for example.
"
Class {
	#name : #TLLineStyle,
	#superclass : #TLObject,
	#category : 'Telescope-Style'
}

{ #category : #'instance creation' }
TLLineStyle class >> new [
	self error: 'you should not create instance of line styles, just use it as enum value'
]
