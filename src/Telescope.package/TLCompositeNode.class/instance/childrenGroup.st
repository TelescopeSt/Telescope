accessing
childrenGroup
	childrenGroup isEmpty ifTrue: [ self createChildrenNodes ].
	^ childrenGroup