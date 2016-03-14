tests
testNodeWithShapeInteractionCorrectlyGenerated
	| node interaction |
	node := TLSimpleNode new.
	interaction := ((TLCustomAction block: [ :aTLDrawable |  ]) withTriggerStyle: #aStyle) onClick.
	node addInteraction: interaction.
	node generateWith: connector.
	self assert: connector view size equals: 2. "the node and the trigger"
	self assert: ((connector interactionsByDrawable at: node) includes: interaction).