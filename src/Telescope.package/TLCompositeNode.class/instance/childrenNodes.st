accessing
childrenNodes
	childrenNodes telescopeEntities ifEmpty: [ self createChildrenNodes ].
	^ childrenNodes