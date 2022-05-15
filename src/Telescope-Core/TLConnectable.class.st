"
A TLConnectable is an abstract class for connectable entities.

Instance Variables
	edgeBuilder:		<Object>

edgeBuilder
	- xxxxx

"
Class {
	#name : #TLConnectable,
	#superclass : #TLDrawable,
	#traits : 'TTLConnectable',
	#classTraits : 'TTLConnectable classTrait',
	#category : #'Telescope-Core-Model'
}

{ #category : #testing }
TLConnectable class >> isAbstract [
	^ self = TLConnectable
]

{ #category : #accessing }
TLConnectable >> allConnections [
	^ self subclassResponsibility
]

{ #category : #connect }
TLConnectable >> connectIfNotTo: aTLEntity [
	^ self subclassResponsibility
]

{ #category : #connect }
TLConnectable >> connectTo: aTLEntity [
	^ self subclassResponsibility
]

{ #category : #connect }
TLConnectable >> connectTo: aTLEntity entity: anObject [
	^ self subclassResponsibility
]

{ #category : #'node-style' }
TLConnectable >> nodeLabel: aBlockOrSelector [
	self styleSheet nodeLabel: aBlockOrSelector
]

{ #category : #connect }
TLConnectable >> removeAllConnections [
	self allConnections do: #removed
]

{ #category : #accessing }
TLConnectable >> removed [
	self removeAllConnections.
	super removed
]
