action
actionOn: aNode
	(aNode state at: #expanded ifAbsentPut: [false])
		ifTrue: [ self collapseNode: aNode ]
		ifFalse: [ self expandNode: aNode ].
	aNode requireUpdateAndLayoutApplication.
	aNode visualization update