accessing
nodeBuilder
	nodeBuilder ifNil: [ nodeBuilder := self defaultNodeBuilder ].
	^ nodeBuilder