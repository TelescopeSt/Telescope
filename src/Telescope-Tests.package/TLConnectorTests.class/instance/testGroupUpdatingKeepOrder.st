as yet unclassified
testGroupUpdatingKeepOrder
	| group cNode aNode bNode |
	group := TLEntitiesGroup new.
	group generator: connector.
	group styleSheet nodeClass: TLSimpleNode; layout: nil.
	aNode := group addNodeFromEntity: $a.
	bNode := group addNodeFromEntity: $b.
	cNode := group addNodeFromEntity: $c.
	group generate.
	group moveToFirstPosition: cNode.
	group update.
	self assert: (connector elementFromTLDrawable: group) equals: {cNode -> #element . aNode -> #element . bNode -> #element } asOrderedCollection