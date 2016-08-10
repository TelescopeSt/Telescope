state
requireUpdate
	super requireUpdate.	"Not calling #requireUpdate for the children group because it will create infinite loop"
	self areChildrenGenerated
		ifTrue: [ self childrenGroup isUpdateRequired: true ]