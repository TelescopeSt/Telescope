"
I represent a link between two nodes. The link is itself an entity of the underlying model.

"
Class {
	#name : #TLConnectionWithEntity,
	#superclass : #TLConnection,
	#instVars : [
		'entity'
	],
	#category : 'Telescope-Model'
}

{ #category : #accessing }
TLConnectionWithEntity >> entity [
	^ entity
]

{ #category : #accessing }
TLConnectionWithEntity >> entity: anObject [
	entity := anObject
]

{ #category : #accessing }
TLConnectionWithEntity >> hasEntity [
	^ true
]
