style
removeStyle: aStyleSymbol
	self assert: aStyleSymbol isSymbol description: 'A style must be a ByteSymbol'.
	(self styles includes: aStyleSymbol)
		ifTrue: [ 
			self styles remove: aStyleSymbol.
			self requireUpdateAndLayoutApplication ]