as yet unclassified
testUpdateGroupWithOneDrawableRequiringLayoutApplication
	| group node rtGroup rtNodeElement |
	group := TLEntitiesGroup new.
	group styleSheet layout: nil.
	rtNodeElement := protocol mock: 'rtElement'.
	rtGroup := OrderedCollection with: rtNodeElement.
	connector shapeByDrawable at: group put: rtGroup.
	node := protocol mock: 'node'.
	protocol describe once: node recv: #parent:; with: group.
	protocol describe allow: node recv: #isVisible; => true.

	group addDrawable: node.
	connector shapeByDrawable at: node put: rtNodeElement.

	protocol describe once: node recv: #updateWith:; => connector.

	connector updateGroup: group.