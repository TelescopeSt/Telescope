as yet unclassified
addLast: aTLVirtual
	(self includes: aTLVirtual)
		ifFalse: [ super addLast: aTLVirtual ].
	aTLVirtual parent = self
		ifFalse: [ aTLVirtual parent: self ]