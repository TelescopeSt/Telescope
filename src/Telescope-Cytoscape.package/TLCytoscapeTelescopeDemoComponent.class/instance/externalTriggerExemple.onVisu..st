as yet unclassified
externalTriggerExemple: html onVisu: visuId
	| interaction |
	interaction := ((TLStyleCustomizationAction custom: [ :style | style borderColor: Color red ])
		condition: [ :elem | elem isComposite ]) onExternalTrigger.
	html button
		onClick: (interaction externalTriggerForVisuId: visuId);
		with: 'Click on me to color composite in red'.	"(interaction triggerOnLeavesForVisuId: visuId)"
	^interaction 	
		