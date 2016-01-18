as yet unclassified
addFirst: aTLVirtual
	(self includes: aTLVirtual)
		ifFalse: [ super addFirst: aTLVirtual ].
	aTLVirtual parent = self
		ifFalse: [ aTLVirtual parent: self ]