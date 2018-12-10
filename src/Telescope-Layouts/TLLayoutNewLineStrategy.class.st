"
I am the superclass for all strategies able to answer if a new line should be created
"
Class {
	#name : #TLLayoutNewLineStrategy,
	#superclass : #Object,
	#category : #'Telescope-Layouts-Core'
}

{ #category : #preparation }
TLLayoutNewLineStrategy >> prepareFor: aGroup onLayout: aLayout [
	"By default do nothing"

	
]

{ #category : #strategy }
TLLayoutNewLineStrategy >> shouldCreateNewLineFrom: currentPosition currentNodeNumberOnLine: anInteger forDimension: nodeDimension [
	^ self subclassResponsibility 
]
