accessing
> aSymbol
	^ self substyles
		at: aSymbol
		ifAbsentPut: [ 
			"The children subgroup is special because it should not create composite nodes by inheriting properties from parent stylesheet"
			aSymbol = #children
				ifTrue: [ self class defaultChildren ]
				ifFalse: [ super > aSymbol ] ]