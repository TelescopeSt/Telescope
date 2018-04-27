"
I am a trait to factorise code for elements
"
Trait {
	#name : #TVirtualElement,
	#category : 'Telescope-Cytoscape-Virtual'
}

{ #category : #testing }
TVirtualElement >> hasParent [
	^ self parent notNil
]

{ #category : #testing }
TVirtualElement >> hasParentNode [
	^ self parentNode notNil
]

{ #category : #accessing }
TVirtualElement >> parent [
	^ self explicitRequirement
]

{ #category : #accessing }
TVirtualElement >> parentNode [
	^ self parent ifNotNil: [ self parent isNode ifTrue: [ self parent ] ifFalse: [self parent parentNode]]
]

{ #category : #position }
TVirtualElement >> relativePositionToParentNodeOrAbsolute [
	^ self position
		+
			(self parent
				ifNil: [ 0 @ 0 ]
				ifNotNil: [ 
					self parent isNode
						ifTrue: [ self parent compositeMargin ]
						ifFalse: [ self parent relativePositionToParentNodeOrAbsolute ] ])
]

{ #category : #actions }
TVirtualElement >> translateBy: aVector [
	self position: self position + aVector
]

{ #category : #actions }
TVirtualElement >> translateTo: aPosition [
	self position: aPosition
]

{ #category : #position }
TVirtualElement >> upperLeftAbsolutePosition [
	^ self absolutePosition - (self dimension / 2)
]
