tests
testCompositeParentDefinition
	| composite node |
	composite:= TLCompositeNode new.
	node := TLSimpleNode new.
	node parentNode: composite.
	self assert: node parentNode equals: composite.
	self assert: composite childrenNodes asArray equals: { node }