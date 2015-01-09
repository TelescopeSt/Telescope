running
testUpdateGroupWithOneDrawableRequiringLayoutApplication
	| group node mockGroup mockSubGroup mockElement groupLayout subGroupLayout mockShape |
	group := TLEntitiesGroup new.
	groupLayout := protocol mock: 'groupLayout'.
	group layout: groupLayout.
	group nodeBuilder: TLNodeBuilder new.
	node := group > #subGroup addNodeFromEntity: 10.
	subGroupLayout := protocol mock: 'subGroupLayout'.
	group > #subGroup layout: subGroupLayout.
	"Those mocks simulate roassal behavior"
	mockElement := protocol mock: 'mockElement'.
	mockShape := protocol mock: 'mockShape'.
	mockSubGroup := OrderedCollection with: mockElement.
	mockGroup := OrderedCollection with: mockSubGroup.
	"protocol describe once: mockElement recv: #update."
	protocol describe once: mockElement recv: #shape; => mockShape.
	protocol describe once: mockElement recv: #model:.
	protocol describe once: mockElement recv: #announcer; => mockElement.
	protocol describe once: mockElement recv: #subscriptions; => mockElement.
	protocol describe once: mockElement recv: #subscriptionsDo:; => mockElement.
	protocol describe once: mockElement recv: #update.
	protocol describe once: mockShape recv: #color:.
	protocol describe once: mockShape recv: #borderColor:.
	protocol describe once: mockShape recv: #borderWidth:.
	protocol describe once: mockShape recv: #height:.
	protocol describe once: mockShape recv: #width:.
	connector shapeByDrawable at: group put: mockGroup.
	connector shapeByDrawable at: group > #subGroup put: mockSubGroup.
	connector shapeByDrawable at: node put: mockElement.
	protocol describe once: subGroupLayout recv: #on:; with: mockSubGroup.
	protocol describe once: groupLayout recv: #on:; with: mockGroup.
	group updateWith: connector.