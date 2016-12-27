as yet unclassified
externalTriggerExemple: html onVisu: visuId
	| interaction |
	interaction := ((TLStyleCustomizationAction custom: [ :style | style borderColor: Color red ])
		condition: [ :elem | elem isComposite ]) onExternalTrigger.
	html mdlButton
		onClick: (interaction externalTriggerForVisuId: visuId);
		raised;
		primaryColor;
		with: 'Click on me to color composite in red'.	"(interaction triggerOnLeavesForVisuId: visuId)"
	^interaction 	
		