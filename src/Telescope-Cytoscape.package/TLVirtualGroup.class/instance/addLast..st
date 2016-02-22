adding
addLast: aTLVirtual
	(self includes: aTLVirtual)
		ifFalse: [ 
			self updateEncompassingByAdding: aTLVirtual.
			super addLast: aTLVirtual ].
	aTLVirtual parent = self
		ifFalse: [ aTLVirtual parent: self ].
	^ aTLVirtual