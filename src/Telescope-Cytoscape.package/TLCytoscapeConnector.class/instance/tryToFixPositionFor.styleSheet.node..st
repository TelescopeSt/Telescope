generation - node
tryToFixPositionFor: virtualNode styleSheet: styleSheet node: aNode
	[ virtualNode defineFixedRelativePosition: (styleSheet obtainValue: #position forEntity: aNode entity inNode: aNode) ]
		on: TLStyleSheetMissingProperty
		do: [  ]