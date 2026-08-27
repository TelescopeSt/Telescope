Class {
	#name : 'TLAbstractDemoFilter',
	#superclass : 'TLObject',
	#category : 'Telescope-Demo',
	#package : 'Telescope-Demo'
}

{ #category : 'accessing' }
TLAbstractDemoFilter class >> filterSymbol [
	^ self subclassResponsibility 
]
