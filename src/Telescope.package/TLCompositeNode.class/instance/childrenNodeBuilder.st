accessing
childrenNodeBuilder
	childrenNodeBuilder ifNil: [ childrenNodeBuilder := self defaultChildrenNodeBuilder ].
	^ childrenNodeBuilder