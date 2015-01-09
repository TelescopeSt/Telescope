removing - group
removeGroup: aTLGroup
	aTLGroup telescopeEntities do: [ :aTLConnectable | aTLConnectable removeWith: self ].
	self shapeByDrawable removeKey: aTLGroup