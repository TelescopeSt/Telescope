running
testUpdateGroupWithOneDrawableRequiringLayoutApplication
	| group node mockGroup mockSubGroup mockElement groupLayout subGroupLayout rectangle |
	group := TLEntitiesGroup new.
	groupLayout := protocol mock: 'groupLayout'.
	group styleSheet: TLStyleSheet default.
	group layout: groupLayout.
	rectangle := protocol mock: 'rectangleShape'.
	node := group > #subGroup addNodeFromEntity: 10.
	subGroupLayout := protocol mock: 'subGroupLayout'.
	group > #subGroup layout: subGroupLayout.
	"Those mocks simulate roassal behavior"
	mockElement := protocol mock: 'mockElement'.
	mockSubGroup := OrderedCollection with: mockElement.
	mockGroup := OrderedCollection with: mockSubGroup.
	protocol describe
		once: rectangle recv: #borderColor:;
		once: rectangle recv: #borderWidth:;
		once: rectangle recv: #width:;
		once: rectangle recv: #color:;
		once: rectangle recv: #isComposite;
		=> false;
		once: rectangle recv: #height:.
	"protocol describe once: mockElement recv: #update."
	protocol describe once: mockElement recv: #model:.
	protocol describe once: mockElement recv: #announcer; => mockElement.
	protocol describe once: mockElement recv: #subscriptions; => mockElement.
	protocol describe once: mockElement recv: #subscriptionsDo:; => mockElement.
	protocol describe once: mockElement recv: #shape; => rectangle .
	protocol describe once: mockElement recv: #update.
	connector shapeByDrawable at: group put: mockGroup.
	connector shapeByDrawable at: group > #subGroup put: mockSubGroup.
	connector shapeByDrawable at: node put: mockElement.
	protocol describe once: subGroupLayout recv: #on:; with: mockSubGroup.
	protocol describe once: groupLayout recv: #on:; with: mockGroup.
	group updateWith: connector.