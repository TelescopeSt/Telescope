visu
drillDownAction: html onVisu: visuId
	| interaction |
	interaction := TLExpandCollapseCompositeNodeAction new
		condition: [ :drawable | 
					drawable isNode
						and: [ 
							drawable isComposite
								and: [ 
									drawable childrenNodes
										ifEmpty: [ true ]
										ifNotEmpty: [ drawable childrenNodes anySatisfy: [ :child | child isVisible not ] ] ] ] ];
		onExternalTrigger.
	html button
		onClick: (interaction externalTriggerForVisuId: visuId);
		with: 'Click to unfoldComposite'.
	^ interaction