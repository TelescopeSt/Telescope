as yet unclassified
testUpdateGroupWithOneDrawableRequiringLayoutApplication
	| group node rtGroup rtNodeElement |
	group := protocol mock: 'group'.
	rtNodeElement := protocol mock: 'rtElement'.
	rtGroup := OrderedCollection with: rtNodeElement.
	connector shapeByDrawable at: group put: rtGroup.
	node := protocol mock: 'node'.
	connector shapeByDrawable at: node put: rtNodeElement.
	protocol describe once: group recv: #isUpdateRequired; => true.
	protocol describe once: group recv: #telescopeEntities; => { node }.
	protocol describe once: node recv: #updateWith:; => connector.
	protocol describe once: group recv: #updateDone.
	protocol describe once: group recv: #isLayoutApplicationRequired; => true.
	protocol describe once: group recv: #layout; => nil.
	protocol describe once: group recv: #layoutApplicationDone; => nil.
	connector updateGroup: group.