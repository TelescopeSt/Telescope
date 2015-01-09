as yet unclassified
getDefaultInteractions
	| shapeInteraction |
	shapeInteraction := TLLabelShape new text: '+'.
	shapeInteraction color: Color red.
	shapeInteraction stateUpdate
		at: #childrenExpanded
		put: [ :result :s | 
			s
				text:
					(result
						ifTrue: [ '-' ]
						ifFalse: [ '+' ]) ].
	^ {((TLExpandCollapseCompositeNodeAction new withShape: shapeInteraction)
		condition: [ :node | (node property rtValue: node entity) notEmpty ])}