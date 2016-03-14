tests
testNodeWithShapeInteractionCorrectlyRemoved
	| node interaction |
	node := TLSimpleNode new.
	interaction := (TLCustomAction block: [ :aTLDrawable |  ]) withTriggerStyle: #aStyle.
	node addInteraction: interaction.
	node generateWith: connector.
	self assert: connector view size equals: 2. "the node and the trigger"
	node removeWith: connector.
	self assert: connector view isEmpty
	