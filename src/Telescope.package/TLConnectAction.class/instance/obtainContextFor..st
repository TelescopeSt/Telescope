action
obtainContextFor: aConnectable
	^ self context ifNil: [ aConnectable visualization ]