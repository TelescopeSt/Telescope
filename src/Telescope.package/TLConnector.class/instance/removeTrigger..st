removing - interaction
removeTrigger: aTLShapeTrigger 
	| element |
	[element := self elementFromTLDrawable: aTLShapeTrigger.
	self removeElementFromView: element associatedToDrawable: aTLShapeTrigger.
	self shapeByDrawable removeKey: aTLShapeTrigger.
	self removeInteractionsOf: aTLShapeTrigger.] on: KeyNotFound do: [  ]