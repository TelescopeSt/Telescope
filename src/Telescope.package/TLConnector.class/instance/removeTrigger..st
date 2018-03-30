removing - interaction
removeTrigger: aTLShapeTrigger 
	| element |
	[element := self elementFromTLDrawable: aTLShapeTrigger.
	self removeElementFromView: element associatedToDrawable: aTLShapeTrigger.
	self unregisterShapeForDrawable: aTLShapeTrigger.
	self removeInteractionsOf: aTLShapeTrigger.] on: KeyNotFound do: [  ]