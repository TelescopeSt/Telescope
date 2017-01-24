action
obtainContextFor: aConnectable
	self flag: #Question. "Should we limit to visibles nodes?"
	^ self context value ifNil: [ aConnectable visualization obtain recursively nodes ]