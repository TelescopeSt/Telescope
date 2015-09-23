as yet unclassified
testGroupUpdatingAddElement
	| group cNode aNode bNode |
	group := TLEntitiesGroup new.
	group generator: connector.
	group styleSheet nodeClass: TLSimpleNode; layout: nil.
	aNode := group addNodeFromEntity: $a.
	bNode := group addNodeFromEntity: $b.
	group generate.
	cNode := group addNodeFromEntity: $c.
	group update.
	self assert: (connector elementFromTLDrawable: group) equals: {aNode -> #element . bNode -> #element . cNode -> #element } asOrderedCollection