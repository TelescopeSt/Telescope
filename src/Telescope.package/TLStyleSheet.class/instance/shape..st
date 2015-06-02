shape
shape: aShape
	self assert: (aShape inheritsFrom: TLSimpleShape) description: 'You must provide a subclass of TLSimpleShape'.
	self at: #shape put: aShape