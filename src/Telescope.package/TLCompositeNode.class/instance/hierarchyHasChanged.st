private
hierarchyHasChanged
	| changedBefore |
	changedBefore := self hierarchyChanged.
	super hierarchyHasChanged.	"In addition to parent, we notify children if this node was not notified before"
	changedBefore
		ifFalse: [ 
			self areChildrenGenerated
				ifTrue: [ self childrenGroup do: #hierarchyHasChanged ] ]