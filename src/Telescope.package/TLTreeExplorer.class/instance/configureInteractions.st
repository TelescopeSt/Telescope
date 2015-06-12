private
configureInteractions
	| action |
	action := TLExpandCollapseNodesAction new property: self property.
	self
		addInteraction:
			(action
				withTriggerStyle: [ :triggerStyle :element | 
					triggerStyle
						shape: TLEllipse;
						width: 8;
						height: 8;
						backgroundColor:
								((element state at: #expanded ifAbsent: [ false ])
										ifTrue: [ Color blue ]
										ifFalse: [ Color red ]) ]) onClick