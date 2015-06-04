as yet unclassified
removeTrigger: aTLShapeTrigger 
	| shape |
	[shape := self elementFromTLDrawable: aTLShapeTrigger.
	self removeElementNodeFromView: shape.
	self shapeByDrawable removeKey: aTLShapeTrigger.
	self removeInteractionsOf: aTLShapeTrigger.] on: KeyNotFound do: [  ]