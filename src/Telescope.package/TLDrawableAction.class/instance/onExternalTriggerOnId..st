as yet unclassified
onExternalTriggerOnId: aString
	| interaction |
	interaction := self onExternalTrigger.
	(TLCytoscapeWebSocketDelegate visualizationWithId: aString) addInteraction: interaction.
	^ interaction