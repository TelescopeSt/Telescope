demos
exampleHideAndShowCompositeNodeConnections
	<script: 'self exampleHideAndShowCompositeNodeConnections open'>

	| visualization oneNode twoNode connection shiftAction |
	visualization := TLVisualization new.
	visualization childrenProperty: #(1 2 3).
	visualization styleSheet compositeExpandedByDefault: false.
	oneNode := visualization addNodeFromEntity: 1.
	twoNode := visualization addNodeFromEntity: 2.
	oneNode removeAllInteractions. twoNode removeAllInteractions.
	shiftAction := ((TLExpandCollapseShiftConnections
				withTriggerStyle: [ :triggerStyle :compositeNode | 
					triggerStyle
						onlyLabelForNodes.
					compositeNode expanded
						ifFalse: [ 
							triggerStyle
								nodeLabel: '+']
						ifTrue: [ 
							triggerStyle
								nodeLabel: '-' ] ]) condition: #hasChildren).
	oneNode addInteraction: shiftAction onClick.
	twoNode addInteraction: ((TLExpandCollapseShiftConnections
				withTriggerStyle: [ :triggerStyle :compositeNode | 
					triggerStyle
						onlyLabelForNodes.
					compositeNode expanded
						ifFalse: [ 
							triggerStyle
								nodeLabel: '+']
						ifTrue: [ 
							triggerStyle
								nodeLabel: '-' ] ]) condition: #hasChildren) onClick.
	connection := oneNode connectTo: twoNode.
	(1 to: 3) do: [:i | oneNode childrenGroup connectInsideGroupEntity: i toEntity: i FromAnotherGroup: twoNode childrenGroup].
	oneNode connectTo: twoNode childrenGroup.
	oneNode childrenGroup connectTo: twoNode.
	visualization addInteraction: (TLHideAction on: connection) onClick.
	^ visualization
	
	