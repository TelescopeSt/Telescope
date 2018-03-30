generation - group
generateGroup: aTLGroup
	| group |
	group := self
		createGroup: aTLGroup
		with:
			(aTLGroup telescopeEntities
				select: #isVisible
				thenCollect: [ :aTLConnectable | 
					self
						elementFromTLDrawable: aTLConnectable
						ifPresent: [ :element | 
							"If a node already exist, just remove it and regenerate it."
							aTLConnectable
								removeWith: self;
								generate ]
						ifNone: [ aTLConnectable generate ] ]).
	self registerShape: group forDrawable: aTLGroup.
	self applyLayoutOf: aTLGroup on: group.
	^ group