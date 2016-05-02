dimension
occupyMaxSpace
	^ self realNode ifNil: [ false ] ifNotNil: [ self realNode effectiveStyleSheet takeAllSpace ]