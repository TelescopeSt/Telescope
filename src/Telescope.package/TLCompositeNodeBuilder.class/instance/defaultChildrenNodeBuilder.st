accessing
defaultChildrenNodeBuilder
	| nodeBuilder |
	nodeBuilder := TLNodeBuilder newWithGenerator: self generator.
	^ nodeBuilder