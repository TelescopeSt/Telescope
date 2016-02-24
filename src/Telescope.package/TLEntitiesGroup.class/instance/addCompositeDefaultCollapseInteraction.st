interactions
addCompositeDefaultCollapseInteraction
	"If the user call me, each composite node will have an interaction with a default shape to expand/collapse the node."

	self
		addInteraction:
			((TLExpandCollapseCompositeNodeAction
				withTriggerStyle: [ :triggerStyle :compositeNode | 
					compositeNode expanded
						ifFalse: [ triggerStyle nodeLabel: '+' ]
						ifTrue: [ triggerStyle nodeLabel: '-' ] ])
				condition: [ :drawable | drawable isNode and: [ drawable isComposite and: [ drawable hasChildren ] ] ];
				onClick)