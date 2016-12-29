as yet unclassified
actionOn: aNode
	aNode expanded
		ifTrue: [ self collapseNode: aNode ]
		ifFalse: [ self expandNode: aNode ].
	"aNode hierarchyHasChanged."
	aNode requireUpdateAndLayoutApplication.
	aNode childrenGroup do: #requireUpdateAndLayoutApplication.
	"aNode visualization update" "this line is comment for performance issu. Visualization update may be realize only be the connector !"