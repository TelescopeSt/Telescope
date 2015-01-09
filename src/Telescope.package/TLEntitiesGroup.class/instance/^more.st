accessing
> aSubGroupSymbol
	^ self subGroupsDictionary 
		at: aSubGroupSymbol
		ifAbsentPut: [ 
			| newGroup |
			newGroup := TLEntitiesGroup new parent: self.
			self telescopeEntities addLast: newGroup.
			newGroup ]