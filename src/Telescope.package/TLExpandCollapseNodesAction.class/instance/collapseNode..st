action
collapseNode: aNode
	[(self parentToChildren at: aNode)
		do: [ :node | 
			(node state at: self expandIdentifier ifAbsent: [ false ])
				ifTrue: [ self collapseNode: node ].
			node parent remove: node ].
	self parentToChildren removeKey: aNode.
	aNode state at: self expandIdentifier put: false] on: KeyNotFound do: [ self flag: 'Should not happen but must investigate on it' ]