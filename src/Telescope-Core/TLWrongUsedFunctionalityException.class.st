"
I am an abstract exception for all detected wrong usage of Telescope
"
Class {
	#name : #TLWrongUsedFunctionalityException,
	#superclass : #TLError,
	#instVars : [
		'entity'
	],
	#category : #'Telescope-Core-Exceptions'
}

{ #category : #accessing }
TLWrongUsedFunctionalityException >> entity [
	^ entity
]

{ #category : #accessing }
TLWrongUsedFunctionalityException >> entity: aTLEntity [ 
	entity := aTLEntity
]
