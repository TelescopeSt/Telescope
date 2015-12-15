generation - group
generateGroup: aTLGroup
	| group |
	group := self
		createGroup: aTLGroup
		with: (aTLGroup telescopeEntities collect: [ :aTLConnectable | aTLConnectable generate ]).
	self registerShape: group forDrawable: aTLGroup.
	self applyLayoutOf: aTLGroup on: group.
	^ group