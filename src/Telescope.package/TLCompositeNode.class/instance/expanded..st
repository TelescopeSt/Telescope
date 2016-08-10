accessing
expanded: aBoolean
	self state at: #childrenExpanded put: aBoolean.
	self flag: 'Not sure its necessary to generate the children group if it is not visible'.
	self childrenGroup isVisible: aBoolean