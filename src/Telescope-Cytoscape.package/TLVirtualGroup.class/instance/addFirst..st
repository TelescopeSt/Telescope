adding
addFirst: aTLVirtual
	(self includes: aTLVirtual)
		ifFalse: [ 
			self updateEncompassingByAdding: aTLVirtual.
			super addFirst: aTLVirtual ].
	aTLVirtual parent = self
		ifFalse: [ aTLVirtual parent: self ]