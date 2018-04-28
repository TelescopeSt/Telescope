Class {
	#name : #TLAbstractDemoFilter,
	#superclass : #TLObject,
	#category : #'Telescope-Demo'
}

{ #category : #accessing }
TLAbstractDemoFilter class >> filterSymbol [
	^ self subclassResponsibility 
]
