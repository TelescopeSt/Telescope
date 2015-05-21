accessing
shape: aShape
	self at: #shape put: (aShape isClass ifFalse: [ aShape ] ifTrue: [ aShape new ])