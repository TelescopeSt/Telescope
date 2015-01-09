as yet unclassified
actionOn: aNode
	aNode expanded
		ifTrue: [ self collapseNode: aNode ]
		ifFalse: [ self expandNode: aNode ].
	aNode requireUpdateAndLayoutApplication.
	aNode childrenNodes requireUpdateAndLayoutApplication.
	aNode visualization update