Trait {
	#name : #TLTLayoutNode,
	#category : #'Telescope-Layouts'
}

{ #category : #accessing }
TLTLayoutNode >> basicSetDimension: aPoint [
	"Set the dimensions of the real node. This might happen if the user ask a node to take all space."

	self explicitRequirement
]

{ #category : #accessing }
TLTLayoutNode >> basicSetPosition: aPoint [
	"Set the position of the real node. This might happen if the user ask a node to take all space."

	self explicitRequirement
]

{ #category : #'encompassing rectangle' }
TLTLayoutNode >> clearEncompassingRectangle [
	"Should clear the encompassing rectangle cache."

	self explicitRequirement
]

{ #category : #'encompassing rectangle' }
TLTLayoutNode >> computeEncompassingRectangle [
	^ Rectangle center: self position extent: self dimension
]

{ #category : #accessing }
TLTLayoutNode >> dimension: anObject [
	self basicSetDimension: anObject.
	self clearEncompassingRectangle
]

{ #category : #'encompassing rectangle' }
TLTLayoutNode >> encompassingRectangle [
	"Should cache the encompassing rectangle like this:
	
	^ encompassingRectangle ifNil: [ encompassingRectangle := self computeEncompassingRectangle ]"

	self explicitRequirement
]

{ #category : #accessing }
TLTLayoutNode >> position [
	^ self explicitRequirement
]

{ #category : #accessing }
TLTLayoutNode >> position: anObject [
	self basicSetPosition: anObject.
	self clearEncompassingRectangle
]
