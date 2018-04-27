Class {
	#name : #TLAbstractDemoFilter,
	#superclass : #TLObject,
	#category : 'Telescope-Demos'
}

{ #category : #accessing }
TLAbstractDemoFilter class >> filterSymbol [
	^ self subclassResponsibility 
]
