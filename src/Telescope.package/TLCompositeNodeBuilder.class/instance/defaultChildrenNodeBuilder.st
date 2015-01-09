accessing
defaultChildrenNodeBuilder
	| nodeBuilder |
	nodeBuilder := TLNodeBuilder newWithGenerator: self generator.
	nodeBuilder backgroundColor: Color lightBrown.
	^ nodeBuilder