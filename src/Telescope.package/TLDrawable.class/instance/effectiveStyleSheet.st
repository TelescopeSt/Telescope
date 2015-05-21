as yet unclassified
effectiveStyleSheet
	^ self
		buildCompositeStyleSheetFrom:
			(self parent ifNil: [ self styleSheetClass new ] ifNotNil: [ self parent effectiveStyleSheet ])