optimization
updateEncompassingByAdding: aTLVirtual
	encompassingRectangle ifNotNil: [ encompassingRectangle quickMerge: aTLVirtual encompassingRectangle ]