visu
externalTriggerExemple: html onVisu: visuId
	| interaction |
	interaction := ((TLStyleCustomizationAction
		custom: [ :style | style borderColor: MDLColor red ])
		condition: [ :elem | elem isNode and: [ elem isComposite ] ]) onExternalTrigger.
	html button
		onClick: (interaction externalTriggerForVisuId: visuId);
		with: 'Click on me to color composite in red'.	"(interaction triggerOnLeavesForVisuId: visuId)"
	^ interaction