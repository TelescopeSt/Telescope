generation - node
tryToFixPositionFor: virtualNode styleSheet: styleSheet node: aNode
	[ virtualNode defineFixedRelativePosition: (styleSheet obtainValue: #position forEntity: aNode entity) ]
		on: TLStyleSheetMissingProperty
		do: [  ]