removing - group
removeGroup: aTLGroup
	"We delete the group only if the connector generated it before"
	(self shapeByDrawable includesKey: aTLGroup) ifTrue: [ 
	aTLGroup telescopeEntities do: [ :aTLConnectable | aTLConnectable removeWith: self ].
	self unregisterShapeForDrawable: aTLGroup]