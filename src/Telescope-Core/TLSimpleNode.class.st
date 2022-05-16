"
I am just a simple node.
"
Class {
	#name : #TLSimpleNode,
	#superclass : #TLAbstractNode,
	#category : #'Telescope-Core-Model'
}

{ #category : #adding }
TLSimpleNode >> addChild: aChildNode [
	self becomeComposite addChild: aChildNode
]

{ #category : #enumeration }
TLSimpleNode >> allNodesRecursively [
	^ {self}
]

{ #category : #transformation }
TLSimpleNode >> becomeComposite [
	| composite index |
	composite := TLCompositeNode new.
	index := self class instSize.
	[ index > 0 ]
		whileTrue: [ 
			composite instVarAt: index put: (self instVarAt: index).
			index := index - 1 ].
	composite addStyle: composite defaultStyle.
	composite state at: #childrenExpanded put: nil.
	self become: composite
]

{ #category : #'private-connector' }
TLSimpleNode >> generateWith: aConnector [
	| generated |
	generated := aConnector generateSimpleNode: self.
	self hierarchyChangeManaged.
	^ generated
]

{ #category : #testing }
TLSimpleNode >> isLeaf [
	^ true
]

{ #category : #testing }
TLSimpleNode >> isSimpleNode [
	^ true
]

{ #category : #accessing }
TLSimpleNode >> leafs [
	^ {self}
]

{ #category : #'private-connector' }
TLSimpleNode >> removeWith: aTLConnector [
	aTLConnector removeSimpleNode: self
]

{ #category : #'private-connector' }
TLSimpleNode >> updateWith: aTLGenerator [
	aTLGenerator updateSimpleNode: self
]
