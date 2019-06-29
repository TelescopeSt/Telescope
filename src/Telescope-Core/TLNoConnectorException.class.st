"
Description
--------------------

I am a Telescope error raised in case we try to get the connector for a visualization but there is none present in the image.
"
Class {
	#name : #TLNoConnectorException,
	#superclass : #Error,
	#category : #'Telescope-Core-Exceptions'
}

{ #category : #initialization }
TLNoConnectorException >> initialize [
	super initialize.
	self messageText: 'No valid connector present in the image.'
]
