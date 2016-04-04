accessing
position
	self flag: 'Maybe this position should be in the stylesheet'.
	^ position ifNil: [ TLPosition bottom ]