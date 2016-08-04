adding
addChild: aTLDrawable
	childrenGroup ifNil: [ self childrenGroup: aTLDrawable ] ifNotNil: [ self childrenGroup addChild: aTLDrawable ]