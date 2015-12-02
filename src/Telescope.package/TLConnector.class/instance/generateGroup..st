generation - group
generateGroup: aTLGroup
	| group |
	group := self
		createGroup: aTLGroup
		with: (aTLGroup telescopeEntities collect: [ :aTLConnectable | aTLConnectable generate ]).
	self shapeByDrawable at: aTLGroup put: group.
	self applyLayoutOf: aTLGroup on: group.
	^ group