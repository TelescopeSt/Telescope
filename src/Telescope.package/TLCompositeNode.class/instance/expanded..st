accessing
expanded: aBoolean
	self state at: #childrenExpanded put: aBoolean.
	self childrenGroup isVisible: aBoolean