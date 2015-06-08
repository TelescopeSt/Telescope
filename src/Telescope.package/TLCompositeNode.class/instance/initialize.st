initialization
initialize
	super initialize.
	self state at: #childrenExpanded put: true.
	self
		childrenGroup:
			(TLEntitiesGroup new
				parent: self;
				style: #children).
	self
		addInteraction:
			((TLExpandCollapseCompositeNodeAction
				withTriggerStyle: [ :triggerStyle :compositeNode | 
					triggerStyle
						onlyLabelForNodes.
					compositeNode expanded
						ifFalse: [ 
							triggerStyle
								nodeLabel: '+']
						ifTrue: [ 
							triggerStyle
								nodeLabel: '-' ] ]) condition: #hasChildren; onClick)