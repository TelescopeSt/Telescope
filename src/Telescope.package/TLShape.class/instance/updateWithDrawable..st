as yet unclassified
updateWithDrawable: aTLDrawable
	self stateUpdate keysAndValuesDo: [ :condition :update |
		update value: (aTLDrawable state at: condition ifAbsent: [false]) value: self ]