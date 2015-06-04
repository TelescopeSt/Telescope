as yet unclassified
secondStyle: aStyleOrStyleSheetCustomizationBlock
	aStyleOrStyleSheetCustomizationBlock isSymbol
		ifTrue: [ secondStateStyle := aStyleOrStyleSheetCustomizationBlock ]
		ifFalse: [ aStyleOrStyleSheetCustomizationBlock value: self styleSheet > #second ]