accessing
childrenNodeBuilder
	childrenNodeBuilder ifNil: [ childrenNodeBuilder := self defaultChildrenNodeBuilder ].
	childrenNodeBuilder = self
		ifTrue: [ self childrenNodeBuilder: self copy ].
	^ childrenNodeBuilder 