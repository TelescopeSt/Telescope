accessing
childrenGroup
	childrenGroup isEmpty ifTrue: [ [self createChildrenNodes] on: TLNoChildrenPropertyException do: [  ] ].
	^ childrenGroup