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
			(TLExpandCollapseCompositeNodeAction
				withTriggerStyled: [ :collapsedStyleSheet | 
					collapsedStyleSheet
						shape: TLEllipse;
						width: 3;
						height: 3;
						nodeLabel: '+';
						backgroundColor: Color red ]
				thatBecome: [ :expandedStyleSheet | expandedStyleSheet backgroundColor: Color green ]) onClick