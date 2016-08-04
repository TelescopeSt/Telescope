accessing
> aSubGroupSymbol
	^ self subGroupsDictionary
		at: aSubGroupSymbol
		ifAbsentPut: [ 
			TLEntitiesGroup new
				parent: self;
				yourself ]