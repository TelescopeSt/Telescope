as yet unclassified
testLayoutApplication
	| nodes |
	nodes := (1 to: 10) collect: [ :i | TLVirtualNode new dimension: 5@8 ].
	RTGridLayout new applyOn: nodes.
	nodes do: [:aNode | self assert: aNode position notNil ]