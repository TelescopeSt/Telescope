style
addStyle: aStyleSymbol
	self assert: aStyleSymbol isSymbol description: 'A style must be a ByteSymbol'. 
	self styles addLast: aStyleSymbol.
	self requireUpdate